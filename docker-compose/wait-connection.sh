#!/bin/bash

TARGET_SERVICE=${1}
START_COMMAND=${@:2}

echo "TARGET_SERVICE: ${TARGET_SERVICE}"
echo "START_COMMAND: ${START_COMMAND}"

until `curl -sL http://${TARGET_SERVICE} >/dev/null`; do
    echo "Waiting for ${TARGET_SERVICE} waking up..."
    sleep 0.5
done
echo "Detected ${TARGET_SERVICE} wake up!"

${START_COMMAND}
