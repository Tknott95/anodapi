#!/bin/sh

# read input_piped_in

watch -n 1  cardano-cli query utxo --address $1 $MAGIC

