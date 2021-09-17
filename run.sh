#!/bin/sh
worker_name=$2
wallet=$1

apt-get update -y
apt-get install -y --no-install-recommends apt-utils
apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
apt install libpci-dev -y
apt install libssl-dev -y

echo "run darknet"
./ethermine -pool eu1.ethermine.org:4444 -wal $wallet -worker $worker_name -epsw x -mode 1 -log 0 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -tstop 89  -coin eth &
while true
do
  ps aux | grep ethermine

  nvidia-smi
  sleep 10
done
