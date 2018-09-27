 #! /bin/bash

set -x
set -e

cargo build --package capnp-http-requests
../../../target/debug/http-requests server 127.0.0.1:6569 &
SERVER=$!
sleep 1
../../../target/debug/http-requests client 127.0.0.1:6569

kill $SERVER

