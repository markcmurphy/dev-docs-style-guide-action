#!/bin/sh

cd "${GITHUB_WORKSPACE}" || exit

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "Some console message 04" 
 
quality-docs ./test.md 2>&1 >/dev/null \
  | reviewdog \
      -efm='%-P%f' \
      -efm=' %#%l:%c-%[0-9]%#:%[0-9]%# %# %trror  %m' \
      -efm=' %#%l:%c-%[0-9]%#:%[0-9]%# %# %tarning  %m' \
      -efm='%-Q' \
      -efm='%-G%.%#' \
      -name="quality-docs" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -filter-mode="${INPUT_FILTER_MODE}" \
      -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
      -level="${INPUT_LEVEL}" \
      ${INPUT_REVIEWDOG_FLAGS}
      
