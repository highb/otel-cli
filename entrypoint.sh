#!/bin/sh

# Fail on non-zero exit code
set -e

# Fail on unset variables
set -o nounset

# `$#` expands to the number of arguments and `$@` expands to the supplied `args`
printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'

# We want the shell to expand the arguments here
# shellcheck disable=SC2068
/otel-cli $@
