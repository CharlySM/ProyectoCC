Para testear la composición del docker-compose se ha desarrollado una github action de forma que esto construya el cluster y lance varias peticiones para probar el cluster.

El [fichero](https://github.com/CharlySM/ProyectoCC/blob/master/.github/workflows/tester-docker_compose.yml) se puede ver a continuación.
```
name: Comprobar que docker compose funciona
on: [push,pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Construye el cluster
        run: docker-compose up -d
      - name: Testea api R
        run: |
          wget 'http://localhost:8000/team?team=Granada' || exit 1
          wget 'http://localhost:8000/manyTeams?team1=Granada&team2=Huesca' || exit 1
      - name: Testea api Ruby
        run: |
          wget 'http://localhost' || exit 1
```
