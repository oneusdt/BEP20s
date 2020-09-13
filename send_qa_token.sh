#!/bin/bash
set -x
set -e 

source .env.bsc.qa
source tokens.bscqa.env

# This is for testnet - deploy only

START=`date +%s`

print_progress () {
  printf "\e[0;33m$1\e[0m\n"
}

print_success () {
  printf "\e[4;32m$1\e[0m\n"
}

npx oz compile --solc-version=0.5.16 --optimizer on

npx oz session --network $NETWORK

export RECV=0x7E1B9fC6d74D162b9b7201086271b7D5CB4C0b18

npx oz send-tx --to $USDT --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $BUSD --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $DAI --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $ETH --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $BTCB --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10e18
npx oz send-tx --to $BCH --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $LTC --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $EOS --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $XRP --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $DOT --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $LINK --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $ONT --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18
npx oz send-tx --to $FOR --method "transfer(address,uint256)" -n $NETWORK --args $RECV,10000e18

END=`date +%s`

print_success "\nDone. Runtime: $((END-START)) seconds."

exit 1
