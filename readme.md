# A translator from BPMN to Promela

## installation

```bash
yarn
```

## Execution

```bash
yarn start
```

The translator will read all BPMN files from the src/bpmn folder and generate Promela files in the src/promela folder.
The BPMN files are organized into three folders:

- improper: contains BPMN files that are not correct
- correct: contains BPMN files that are correct
- performance: contains BPMN files that are used for performance evaluation
