#!/bin/bash

git pull

kill $(cat /home/undergrad/1/nflorian/rails3260/tmp/pids/server.pid)

rails server -d -p 32093 -b 0.0.0.0
