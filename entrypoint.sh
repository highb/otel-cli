#!/bin/sh

# Fail on non-zero exit code
set -e

if [ "${SERVER}" = "true" ]; then
  echo "Starting otel-cli in server mode"
  /otel-cli server tui
else
  # We want the shell to expand the arguments here
  # shellcheck disable=SC2068
  /otel-cli $@
fi
