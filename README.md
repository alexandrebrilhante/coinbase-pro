# coinbase-pro

![GitHub](https://img.shields.io/github/license/brilhana/coinbase-pro)

Coinbase Pro API client in Nim.

# Usage

```nim
import asyncdispatch
import coinbase_pro

let cb = newCoinbase()
let subs = waitFor cb.subscribe(@[ctHeartbeat, ctFull], @["BTC-USD"])

for x in subs:
    if x.`type` == ctFull:
        echo x
```
