#!/bin/sh

# Fail on non-zero exit code
set -e

# Set verbose output
set -x

if [ "${SERVER}" = "true" ]; then
  echo "Starting otel-cli in server mode"
  /otel-cli server tui
else
  # We want the shell to expand the arguments here
  # shellcheck disable=SC2068
  echo "set -x" > ./script.sh
  echo "export PATH=\$PATH:/" >> ./script.sh
  echo "$@" >> ./script.sh
  sh script.sh
fi
