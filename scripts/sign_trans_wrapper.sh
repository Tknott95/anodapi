#!/bin/sh

tx_dir_name=$1

sc_skey=./keys/alwayssucceeds-v2/alwayssucceeds-v2_payment.skey
tx_out_loc=./transactions/$tx_dir_name

echo "SC_ADDR USING: " $sc_addr

./scripts/sign_trans.sh \
  $tx_out_loc"/tx.build" \
  $sc_skey \
  $tx_out_loc"/tx.signed"


echo "TX SIGNED:  $tx_out_loc/tx.signed"


./scripts/submit_trans.sh $tx_out_loc"/tx.signed"
