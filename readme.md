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


# Check the Models with ISpin

To use ISpin to check the models use provided docker compose file (if needed install docker first).

## Installation/start
```bash
cd docker
docker compose up
```


## Open VCL

Go to the browser and open

`http://localhost:6080/vnc.html`

Enjoy

## Errors

`ispin  | /usr/bin/env: 'bash\r': No such file or directory`

Windows CRLF Error, change the file ending to LF

Then 
```bash
docker compose down
docker compose build --no-cache
docker compose up
```


