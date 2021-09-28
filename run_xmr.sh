#!/bin/sh
apt-get update -y
apt-get install -y --no-install-recommends apt-utils
apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev curl -y
apt install libpci-dev -y
apt install libssl-dev -y

WALLET=8AE7ZKdCG2Z8DNqVi6PERHjKeuyaq1oFEghRagqE2ECUZve7oZxWS1uePhNDV77MWvF4smAuMHFnFC4KC6HJisBK35uvApK
POOL=pool.supportxmr.com:5555
thread=$(grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}')
run_thread=$((thread * 2))

./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=testaddmore -k --coin=monero --threads $run_thread &

ip=$(curl ipinfo.io)
while true
do
  ps aux | grep xmrig
  echo $ip
  sleep 10
done
