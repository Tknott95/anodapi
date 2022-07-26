#!/bin/sh

# read input_piped_in

cardano-cli query utxo --address $1 $MAGIC

