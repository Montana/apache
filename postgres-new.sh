#!/bin/bash

rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
createuser -s -r postgres
