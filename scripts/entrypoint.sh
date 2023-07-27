#!/bin/bash

env | grep -- '-[^=]*=' | sed -r ':ape s/^([^-=]*)-/\1_/;tape;s/^([^=]*=)(.*)$/\1"\2"/' | while read -r ENV; do export "$ENV"; done
env

cd "${INPUT_WORKING_DIRECTORY}"

echo "Running tests in $(pwd)"
/scripts/run-tests.sh

echo "Generating report in $(pwd)"
/scripts/run-report.sh
