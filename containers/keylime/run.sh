#!/bin/bash

python ../keylime/cloud_verifier_tornado.py &
sleep 10 && python ../keylime/registrar.py
