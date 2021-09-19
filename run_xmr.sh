WALLET=xxxx
POOL=pool.supportxmr.com:5555

./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=worker -k --coin=monero --max-cpu-usage=75 &
