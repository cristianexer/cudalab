# Minimal Jupyter Lab CUDA based docker environment

This repository deploys a jupyter lab instance inside a container using CUDA 11.4 image from NVIDIA


## Tested on the device with next specs


`OS`   : Windows 11

`GPU`  : RTX 3090

`CUDA` : 11.5.1


**Test docker tensorflow GPU access**

```bash
docker-compose -f docker-compose-test-host.yaml up -d
```


**Deploy Jupyter lab**

```bash
docker-compose up -d
```


[Open Jupyter Lab](http://localhost:8888)



TODOS:
- [ ] Add Plotly support for jupyterlab
- [ ] Add VSCode server option
- [ ] Default Jupyterlab settings