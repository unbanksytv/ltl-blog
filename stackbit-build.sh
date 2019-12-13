#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df3ca64d813d1001409794c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df3ca64d813d1001409794c
curl -s -X POST https://api.stackbit.com/project/5df3ca64d813d1001409794c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df3ca64d813d1001409794c/webhook/build/publish > /dev/null
