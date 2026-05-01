import { convertBpmnToPromela } from './bpmnToPromelaTranslator.js';
import fs from 'fs';

// go htorugh the improper folder and get all files
const improper_files = fs.readdirSync('./src/bpmn/improper');
const correct_files = fs.readdirSync('./src/bpmn/correct');
const performance_files = fs.readdirSync('./src/bpmn/performance');

improper_files.forEach(async (file) => {
  const xml = fs.readFileSync('./src/bpmn/improper/' + file, 'utf-8');
  const promela = await convertBpmnToPromela(xml);
  file = file.replace('.bpmn', '');
  fs.writeFileSync('./src/promela/improper/' + file + '.pml', promela);
});

correct_files.forEach(async (file) => {
  const xml = fs.readFileSync('./src/bpmn/correct/' + file, 'utf-8');
  const promela = await convertBpmnToPromela(xml);
  file = file.replace('.bpmn', '');
  fs.writeFileSync('./src/promela/correct/' + file + '.pml', promela);
});

performance_files.forEach(async (file) => {
  const xml = fs.readFileSync('./src/bpmn/performance/' + file, 'utf-8');
  const promela = await convertBpmnToPromela(xml);
  file = file.replace('.bpmn', '');
  fs.writeFileSync('./src/promela/performance/' + file + '.pml', promela);
});

// // const file_name = '/improper/multiple_terminations';
// const file_name = '/correct/exclusive_ends';

// const xml = fs.readFileSync('./src/bpmn/' + file_name + '.bpmn', 'utf-8');

// const promela = await convertBpmnToPromela(xml);

// // console.log(promela);

// fs.writeFileSync('./src/promela/' + file_name + '.pml', promela);
