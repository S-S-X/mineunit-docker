#!/bin/bash

cd "${INPUT_WORKING_DIRECTORY}"

echo "Running tests in $(pwd)"
/scripts/run-tests.sh

echo "Generating report in $(pwd)"
/scripts/run-report.sh
