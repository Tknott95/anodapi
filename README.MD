# anodapi

`curl http://localhost:1335/api/txs | jq`

`curl http://localhost:1335/api/txs -X GET | jq ".[0].utxoUsing"`

`curl http://localhost:1335/api/txs -X GET | jq "map(.utxoUsing)"`


```
curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{"payoutAddr":"addr_tfkkkhfgfkhfk7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak","scriptAddr":"addr_test1qkggkgkk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x","txOutLoc":"txAltTesting01","utxoUsing":"5cb9ba32a713ca2f61e22a0c8c6d9a4c70b17098064d4ef18e37795f686e0584#0"}' \
  http://localhost:1335/api/post/tx | jq
```
5cb9ba32a713ca2f61e22a0c8c6d9a4c70b17098064d4ef18e37795f686e0584