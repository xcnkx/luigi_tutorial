## Luigi hands-on

This is a hands-on docs for Luigi.

## Requirements
- poetry
- python 3.10^

## Installation
```bash
make setup
```

## How to run

First, run luigid server.
```bash
make run/luigid
```

Next, run task in other terminal.
```bash
make run/task
```

## View luigi task web UI
```bash
open http://localhost:8082
```

## View luigi task history
```bash
open http://localhost:8082/history
```


## References
- [Luigi official docs](https://luigi.readthedocs.io/en/stable/)
- https://dataimpact.medium.com/how-to-create-etl-in-luigi-9d2eb4001db1