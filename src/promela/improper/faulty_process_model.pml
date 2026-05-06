bool Event_0omf2ig;
ltl test { <> ((Event_0omf2ig) && (len(Flow_0651tg3) == 0 && len(Flow_0ouf0f2) == 0 && len(Flow_0h66a89) == 0 && len(Flow_0rg1qmh) == 0 && len(Flow_0d3j90s) == 0 && len(Flow_068g47e) == 0 && len(Flow_0d9pde9) == 0 && len(Flow_1dn07pe) == 0 && len(Flow_0fim20k) == 0))}
chan Flow_0651tg3 = [2] of { bit };
chan Flow_0ouf0f2 = [2] of { bit };
chan Flow_0h66a89 = [2] of { bit };
chan Flow_0rg1qmh = [2] of { bit };
chan Flow_0d3j90s = [2] of { bit };
chan Flow_068g47e = [2] of { bit };
chan Flow_0d9pde9 = [2] of { bit };
chan Flow_1dn07pe = [2] of { bit };
chan Flow_0fim20k = [2] of { bit };

proctype Node_FlowNode_1() {
  start_FlowNode_1:
  atomic {
    Flow_0651tg3!1;
  }
}


proctype Node_Activity_0j1wpr5() {
  task_Activity_0j1wpr5:
  atomic {
    do
    :: Flow_0ouf0f2?1 ->
       Flow_0h66a89!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_0omf2ig() {
end_Event_0omf2ig:
  atomic {
    Flow_0fim20k?1;
    Event_0omf2ig = 1;
  }
}


proctype Node_Activity_04cg2zp() {
  task_Activity_04cg2zp:
  atomic {
    do
    :: Flow_068g47e?1 ->
       Flow_0rg1qmh!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_069nvk2() {
  parallel_gateway_Gateway_069nvk2:
    atomic {
      do
      :: nempty(Flow_0651tg3) ->
        Flow_0651tg3?1;
        Flow_0ouf0f2!1;
        assert(len(Flow_0ouf0f2) < 2);
        Flow_0d3j90s!1;
        assert(len(Flow_0d3j90s) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_0kzt77d() {
  parallel_gateway_Gateway_0kzt77d:
    atomic {
      do
      :: nempty(Flow_0h66a89) && nempty(Flow_0rg1qmh) ->
        Flow_0h66a89?1;
        Flow_0rg1qmh?1;
        Flow_0d9pde9!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_0w80z8k() {
  exclusive_gateway_Gateway_0w80z8k:
  atomic {
    do
    :: Flow_0d3j90s?1 ->
       Flow_068g47e!1;
       assert(len(Flow_068g47e) < 2);
    :: Flow_1dn07pe?1 ->
       Flow_068g47e!1;
       assert(len(Flow_068g47e) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1cp2hjm() {
  exclusive_gateway_Gateway_1cp2hjm:
  atomic {
    do
    :: Flow_0d9pde9?1 ->
        if
        :: Flow_1dn07pe!1;
        :: Flow_0fim20k!1;
        fi;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_0j1wpr5();
    run Node_Event_0omf2ig();
    run Node_Activity_04cg2zp();
    run Node_Gateway_069nvk2();
    run Node_Gateway_0kzt77d();
    run Node_Gateway_0w80z8k();
    run Node_Gateway_1cp2hjm();
    run Node_FlowNode_1();
  }
}
