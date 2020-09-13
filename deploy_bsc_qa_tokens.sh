#!/bin/bash
set -x
set -e 

source .env.bsc.qa

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

USDT=`npx oz deploy -k regular -n $NETWORK BEP20USDT`
print_progress "USDT = $USDT"
echo "USDT=$USDT" >> tokens.bscqa.env

BUSD=`npx oz deploy -k regular -n $NETWORK BEP20BUSDToken`
print_progress "BUSD = $BUSD"
echo "BUSD=$BUSD" >> tokens.bscqa.env

DAI=`npx oz deploy -k regular -n $NETWORK BEP20DAI`
print_progress "DAI = $DAI"
echo "DAI=$DAI" >> tokens.bscqa.env

ETH=`npx oz deploy -k regular -n $NETWORK BEP20Ethereum`
print_progress "ETH = $ETH"
echo "ETH=$ETH" >> tokens.bscqa.env

BTCB=`npx oz deploy -k regular -n $NETWORK BEP20BTCBToken`
print_progress "BTCB = $BTCB"
echo "BTCB=$BTCB" >> tokens.bscqa.env

BCH=`npx oz deploy -k regular -n $NETWORK BEP20BitcoinCash`
print_progress "BCH = $BCH"
echo "BCH=$BCH" >> tokens.bscqa.env

LTC=`npx oz deploy -k regular -n $NETWORK BEP20Litecoin`
print_progress "LTC = $LTC"
echo "LTC=$LTC" >> tokens.bscqa.env

EOS=`npx oz deploy -k regular -n $NETWORK BEP20EOS`
print_progress "EOS = $EOS"
echo "EOS=$EOS" >> tokens.bscqa.env

XRP=`npx oz deploy -k regular -n $NETWORK BEP20XRP`
print_progress "XRP = $XRP"
echo "XRP=$XRP" >> tokens.bscqa.env

DOT=`npx oz deploy -k regular -n $NETWORK BEP20Polkadot`
print_progress "DOT = $DOT"
echo "DOT=$DOT" >> tokens.bscqa.env

LINK=`npx oz deploy -k regular -n $NETWORK BEP20LINK`
print_progress "LINK = $LINK"
echo "LINK=$LINK" >> tokens.bscqa.env

ONT=`npx oz deploy -k regular -n $NETWORK BEP20Ontology`
print_progress "ONT = $ONT"
echo "ONT=$ONT" >> tokens.bscqa.env

FOR=`npx oz deploy -k regular -n $NETWORK BEP20FOR`
print_progress "FOR = $FOR"
echo "FOR=$FOR" >> tokens.bscqa.env

END=`date +%s`

print_success "\nDone. Runtime: $((END-START)) seconds."

exit 1
