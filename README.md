## Quick start

```
 tree -L 1
.
├── docker-compose.yaml
├── Dockerfile
├── ignite.sh           ## optional really
├── master              ## Sources for course NS3
├── README.md
├── requirements.txt
└── run.sh              ## Obsolete really

2 directories, 6 files

## Course stuff
$ git clone https://bitbucket.org/pglut/ns3-sim-2022/src/master/ 

## Build (takes awhile)
$ docker compose build

## Upitty
$ docker compose up -d

## Create container shell (new)
$ docker compose exec ns3 bash
### Alternatively (attaches to main process): 
$ docker compose attach ns3

(pyenv) [ns3#docker-workspace]$ cd ns3-sim-2022/ 
(pyenv) [ns3#ns3-sim-2022]$ ./waf configure
(pyenv) [ns3#ns3-sim-2022]$ ./waf build


## Downity (with all volumes removed)
$ docker compose down --volumes --remove-orphans

```
