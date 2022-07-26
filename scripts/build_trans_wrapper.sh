#!/bin/sh

sc_addr=$(cat ./keys/alwayssucceeds-v2/alwayssucceeds-v2_payment.addr)
utxo_using=$(./scripts/grab_utxo.sh $sc_addr)"#0"

sc_skey=./keys/alwayssucceeds-v2/alwayssucceeds-v2_payment.skey

# @TODO - make this dynamic - this is X4Wallet137
payout_addr=addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak

tx_dir_name=$1

# zrv -f check it first
mkdir ./transactions/$tx_dir_name
tx_out_loc="./transactions/"$tx_dir_name


echo "SC_ADDR USING: " $sc_addr
echo "UTXO USING:  " $utxo_using

./scripts/build_trans.sh \
  $sc_addr\
  $utxo_using \
  $payout_addr \
  $tx_out_loc"/tx.build"


echo "TX BUILT:  $tx_out_loc/tx.build"
