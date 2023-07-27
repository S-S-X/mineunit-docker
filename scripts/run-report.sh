#!/bin/bash

# Generate luacov report and write it to output
mineunit -r
OUT="$(awk -v p=0 '/^----/{p++;next}p==2{exit}p' luacov.report.out | sort -hrk4)"
printf 'report<<END-OF-MINEUNIT-CONTENT\n%s\nEND-OF-MINEUNIT-CONTENT\n' "${OUT}" >> "${GITHUB_OUTPUT}"

# Read and sort coverage information from luacov report
echo "total=$(tail -n 2 luacov.report.out | grep ^Total | grep -o '[0-9.]\+%$')" >> "${GITHUB_OUTPUT}"
awk -v p=0 '/^----/{p++;next}p==2{exit}p' luacov.report.out | sort -hrk4 > luacov.report.sum
echo "files=$(grep -cv '\s0\.00%' luacov.report.sum)/$(wc -l<luacov.report.sum)" >> "${GITHUB_OUTPUT}"

# badge-wrapper-actions-issue-1
echo "badge-name=${INPUT_BADGE_NAME}" >> "${GITHUB_OUTPUT}"
echo "badge-label=${INPUT_BADGE_LABEL}" >> "${GITHUB_OUTPUT}"
echo "badge-color=${INPUT_BADGE_COLOR}" >> "${GITHUB_OUTPUT}"
