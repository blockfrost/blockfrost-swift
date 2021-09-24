#!/bin/bash

PDIR="/tmp/.build-blockfrost-swift"
swift build --skip-update --product Example --build-path "$PDIR"
exec "$PDIR/debug/Example"