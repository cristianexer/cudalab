#!/bin/bash

nvidia-smi;

jupyter lab --ip 0.0.0.0 --port 8888  --NotebookApp.token='' --NotebookApp.password=''  --allow-root --no-browser