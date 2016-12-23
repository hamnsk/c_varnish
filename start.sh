#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -a :6081 -F \
  -f $VCL_CONFIG \
  -T :6082 \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS"