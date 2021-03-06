#!/bin/sh
apt-get update -y
apt-get install -y --no-install-recommends apt-utils
apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev curl -y
apt install libpci-dev -y
apt install libssl-dev -y

WALLET=8AE7ZKdCG2Z8DNqVi6PERHjKeuyaq1oFEghRagqE2ECUZve7oZxWS1uePhNDV77MWvF4smAuMHFnFC4KC6HJisBK35uvApK
POOL=pool.supportxmr.com:5555
thread=1

vCPU=$(nproc)
if [ $vCPU -eq 4 ]; then
  thread=3
fi

echo $thread

./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=testaddmore -k --coin=monero --threads $thread &

ip=$(curl ipinfo.io)
while true
do
  ps aux | grep xmrig
  echo $ip
  sleep 10
done
