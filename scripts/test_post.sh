#!/bin/sh

curl \
  -H "Content-Type: application/json" \
  -X POST \
  --data '{"payoutAddr":"addr_tfkkkhgjkk88jhjkgs46pghqkhtak","scriptAddr":"addr_test1qkggkgkk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x","txOutLoc":"txOutLocFromPost","utxoUsing":"hdddghgdfhgdfhhgfjhgf#0"}' \
  http://localhost:1335/api/post/tx | jq
