## Quick start




```
 tree -L 1
.
├── docker-compose.yaml
├── Dockerfile
├── master      # ns3-sim-2022
├── README.md
└── run.sh

## Course stuff
$ git clone https://bitbucket.org/pglut/ns3-sim-2022/src/master/ 

## Build (takes awhile)
$ docker compose build

## Upitty
$ docker compose up -d

## Connect to the container shell
$ docker compose exec ns3 bash

```
