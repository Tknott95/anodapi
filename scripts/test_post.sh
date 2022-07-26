#!/bin/sh

curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"payoutAddr":"addr_tfkkkhfgfkhfk7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak","scriptAddr":"addr_test1qkggkgkk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x","txOutLoc":"txAltTesting01","utxoUsing":"hdddghgdfhgdfhhgfjhgf#0"}' \
  http://localhost:1335/api/post/tx