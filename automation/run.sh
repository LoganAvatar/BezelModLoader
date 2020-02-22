#!/usr/bin/env bash

docker run \
  --name bezelmaker \
  -it \
  --rm \
  --mount type=bind,source="$(pwd)/rules_engine.sh",target="/usr/local/bin/rules_engine.sh",readonly \
  --mount type=bind,source="$(pwd)/actions.json",target="/input/actions.json",readonly \
  --mount type=bind,source="$(pwd)/gcfw.swf",target="/input/gcfw.swf",readonly \
  --mount type=bind,source="$(pwd)/abc/",target="/input/abc",readonly \
  --mount type=bind,source="$(pwd)/output/",target="/output/" \
  loganavatar/bezel:latest \
  /bin/bash
