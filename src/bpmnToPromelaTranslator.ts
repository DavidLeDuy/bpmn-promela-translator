import { BpmnModdle, Definitions, Collaboration, RootElement } from 'bpmn-moddle';

type ProcessContext = {
  id: string;
  nodes: any[];
  flows: any[];
};

export interface GenerationContext {
  node: any;
  inFlows: any[];
  outFlows: any[];
  messageFlows: any[];
}

export type NodeGenerator = (ctx: GenerationContext) => string;

export class ProcessGeneratorRegistry {
  private generators: Map<string, NodeGenerator> = new Map();

  constructor() {
    this.registerDefaultGenerators();
  }

  public get supportedNodes(): string[] {
    return Array.from(this.generators.keys());
  }

  register(nodeType: string, generator: NodeGenerator) {
    this.generators.set(nodeType, generator);
  }

  generate(ctx: GenerationContext): string {
    let s = `\nproctype Node_${ctx.node.id}() {\n`;
    const generator = this.generators.get(ctx.node.$type);

    if (generator) {
      s += generator(ctx);
    } else {
      s += `    // Unsupported node type: ${ctx.node.$type}\n`;
    }

    s += `}\n`;
    return s;
  }

  private registerDefaultGenerators() {
    this.register('bpmn:StartEvent', (ctx) => {
      let s = `  start_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      const incomingMf = ctx.messageFlows.find((mf: any) => mf.targetRef?.id === ctx.node.id);
      if (incomingMf) s += `    ${incomingMf.id}?1;\n`;
      if (ctx.outFlows.length > 0) s += `    ${ctx.outFlows[0].id}!1;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:EndEvent', (ctx) => {
      let s = `end_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      if (ctx.inFlows.length > 0) s += `    ${ctx.inFlows[0].id}?1;\n`;
      const outgoingMfEnd = ctx.messageFlows.find((mf: any) => mf.sourceRef?.id === ctx.node.id);
      if (outgoingMfEnd) s += `    ${outgoingMfEnd.id}!1;\n`;
      s += `    ${ctx.node.id} = 1;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:Task', (ctx) => {
      // get all outgoing messageFlow
      const outgoingMessageFlows = ctx.messageFlows.filter((mf: any) => mf.sourceRef?.id === ctx.node.id);
      let s = `  task_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      s += `    do\n`;
      if (ctx.inFlows.length > 0) s += `    :: ${ctx.inFlows[0].id}?1 ->\n`;
      for (const mf of outgoingMessageFlows) s += `       ${mf.id}!1;\n`; // send token to another process
      if (ctx.outFlows.length > 0) s += `       ${ctx.outFlows[0].id}!1;\n`; // send token to next node in same process
      s += `    :: timeout -> break;\n`;
      s += `    od;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:IntermediateCatchEvent', (ctx) => {
      //  get all incoming message flows
      const incomingMessageFlows = ctx.messageFlows.filter((mf: any) => mf.targetRef?.id === ctx.node.id);
      const incom = ctx.inFlows.concat(incomingMessageFlows);
      const guard = incom.map((f: any) => `nempty(${f.id})`).join(' && ');
      let s = `  catch_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      s += `    do\n`;
      s += `      :: ${guard} ->\n`;
      for (const f of incom) s += `       ${f.id}?1;\n`;
      if (ctx.outFlows.length > 0) s += `       ${ctx.outFlows[0].id}!1;\n`;
      s += `    :: timeout -> break;\n`;
      s += `    od;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:IntermediateThrowEvent', (ctx) => {
      //  get all outgoing message flows
      const outgoingMessageFlows = ctx.messageFlows.filter((mf: any) => mf.sourceRef?.id === ctx.node.id);
      let s = `  throw_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      s += `  do\n`;
      if (ctx.inFlows.length > 0) s += `    :: ${ctx.inFlows[0].id}?1 ->\n`;
      for (const mf of outgoingMessageFlows) s += `       ${mf.id}!1;\n`;
      if (ctx.outFlows.length > 0) s += `       ${ctx.outFlows[0].id}!1;\n`;
      s += `    :: timeout -> break;\n`;
      s += `  od;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:ExclusiveGateway', (ctx) => {
      let s = `  exclusive_gateway_${ctx.node.id}:\n`;
      s += `  atomic {\n`;
      s += `    do\n`;
      for (let f of ctx.inFlows) {
        s += `    :: ${f.id}?1 ->\n`;
        if (ctx.outFlows.length > 1) {
          s += `        if\n`;
          for (let out of ctx.outFlows) s += `        :: ${out.id}!1;\n`;
          s += `        fi;\n`;
        } else {
          s += `       ${ctx.outFlows[0].id}!1;\n`;
          s += `       assert(len(${ctx.outFlows[0].id}) < 2);\n`;
        }
      }
      s += `    :: timeout -> break;\n`;
      s += `    od;\n`;
      s += `  }\n`;
      return s;
    });

    this.register('bpmn:ParallelGateway', (ctx) => {
      // if exit gate of cycle could be trap for tokens
      // if outflow if > 1 we need to check if there is more than one token in a outgoing flow
      // we have a safeness issue
      let s = '';
      s += `  parallel_gateway_${ctx.node.id}:\n`;
      s += `    atomic {\n`;
      s += `      do\n`;
      const guard = ctx.inFlows.map((f: any) => `nempty(${f.id})`).join(' && ');
      s += `      :: ${guard} ->\n`;
      for (let f of ctx.inFlows) s += `        ${f.id}?1;\n`;
      for (let f of ctx.outFlows) {
        s += `        ${f.id}!1;\n`;
        if (ctx.outFlows.length > 1) s += `        assert(len(${f.id}) < 2);\n`;
      }
      s += `      :: timeout -> break;\n`;
      s += `      od;\n`;
      s += `    }\n`;
      return s;
    });
  }
}

export const processGeneratorRegistry = new ProcessGeneratorRegistry();

export async function convertBpmnToPromela(xml: string): Promise<string> {
  const moddle = new BpmnModdle();
  const x = await moddle.fromXML(xml);
  const rootElement = x.rootElement;
  const definitions = rootElement as Definitions;
  const sanitize = (id: string) => id.replace(/-/g, '_');

  const processes: ProcessContext[] = definitions.rootElements
    .filter((e: RootElement) => e.$type === 'bpmn:Process')
    .map((p: any) => ({
      id: sanitize(p.id),
      nodes: (p.flowElements || [])
        .filter((e: any) => processGeneratorRegistry.supportedNodes.includes(e.$type))
        .map((n: any) => {
          const clone = Object.create(Object.getPrototypeOf(n));
          Object.defineProperties(clone, Object.getOwnPropertyDescriptors(n));
          clone.id = sanitize(n.id);
          return clone;
        }),
      flows: (p.flowElements || [])
        .filter((e: any) => e.$type === 'bpmn:SequenceFlow')
        .map((f: any) => ({
          ...f,
          id: sanitize(f.id),
          sourceRef: f.sourceRef ? { ...f.sourceRef, id: sanitize(f.sourceRef.id) } : f.sourceRef,
          targetRef: f.targetRef ? { ...f.targetRef, id: sanitize(f.targetRef.id) } : f.targetRef,
        })),
    }));

  const messageFlows = (
    (definitions.rootElements.find((e: any) => e.$type === 'bpmn:Collaboration') as Collaboration)?.messageFlows || []
  ).map((mf: any) => ({
    ...mf,
    id: sanitize(mf.id),
    sourceRef: mf.sourceRef ? { ...mf.sourceRef, id: sanitize(mf.sourceRef.id) } : mf.sourceRef,
    targetRef: mf.targetRef ? { ...mf.targetRef, id: sanitize(mf.targetRef.id) } : mf.targetRef,
  }));

  // Collect all unique node IDs across all processes
  const allNodeIds = new Set<string>();
  for (const proc of processes) {
    for (const node of proc.nodes) {
      allNodeIds.add(node.id);
    }
  }

  let promela: string[] = [];

  // // === BOOL DECLARATION ===
  // if (allNodeIds.size > 0) {
  //   promela.push(`bool ${Array.from(allNodeIds).join(', ')};`);
  // }
  // only push end node
  let endEvents: any[] = [];
  for (const proc of processes) {
    endEvents = [...endEvents, ...proc.nodes.filter((n: any) => n.$type === 'bpmn:EndEvent')];
  }

  if (endEvents?.length > 0) {
    promela.push(`bool ${endEvents.map((e: any) => e.id).join(', ')};`);
  }

  const allflows = [...messageFlows, ...processes.flatMap((p: any) => p.flows)];

  // === LTL ===
  // const endEvent = processes[0]?.nodes.find((n: any) => n.$type === 'bpmn:EndEvent')?.id;
  if (endEvents?.length > 0) {
    // promela.push(`ltl reach_all_end_events { <> (${endEvents.map((e: any) => e.id).join(' && ')})};`);
    // promela.push(
    //   `ltl no_token_left_behind { [] ((${endEvents.map((e: any) => e.id).join(' && ')}) -> (${allflows.map((f: any) => `len(${f.id}) == 0`).join(' && ')}))}`,
    // );
    promela.push(
      `ltl test { <> ((${endEvents.map((e: any) => e.id).join(' || ')}) && (${allflows.map((f: any) => `len(${f.id}) == 0`).join(' && ')}))}`,
    );
  }

  // === CHANNELS ===
  for (const flow of allflows) {
    promela.push(`chan ${flow.id} = [2] of { bit };`);
  }

  // === PROCESS GENERATION ===
  for (const proc of processes) {
    for (const node of proc.nodes) {
      const inFlows = proc.flows.filter((f: any) => f.targetRef?.id === node.id);
      const outFlows = proc.flows.filter((f: any) => f.sourceRef?.id === node.id);
      const ctx: GenerationContext = { node, inFlows, outFlows, messageFlows };
      promela.push(processGeneratorRegistry.generate(ctx));
    }
  }

  // === INIT ===
  const startNodes: any[] = [];
  const otherNodes: any[] = [];
  for (const proc of processes) {
    for (const node of proc.nodes) {
      if (node.$type === 'bpmn:StartEvent') {
        startNodes.push(node);
      } else {
        otherNodes.push(node);
      }
    }
  }

  let initCode = '\ninit {\n  atomic {\n';
  for (const node of otherNodes) {
    initCode += `    run Node_${node.id}();\n`;
  }
  for (const node of startNodes) {
    initCode += `    run Node_${node.id}();\n`;
  }

  // if (startNodes.length === 1) {
  //   initCode += `    run Node_${startNodes[0].id}();\n`;
  // } else if (startNodes.length > 1) {
  //   for (const node of startNodes) {
  //     initCode += '    if\n';
  //     initCode += `    :: run Node_${node.id}();\n`;
  //     initCode += `    :: skip;`;
  //     initCode += '    fi;\n';
  //   }
  // }

  initCode += '  }\n}\n';
  promela.push(initCode);

  return promela.join('\n');
}
