#!/bin/sh

set -euf

# Required user inputs.
: "${PULL_REQUEST_URL:?PULL_REQUEST_URL is required}"

# GitHub Actions runtime environment.
: "${GITHUB_STEP_SUMMARY:?GITHUB_STEP_SUMMARY is unset, most likely during testing}"

# Derived defaults.
HEADING="${HEADING:-Pull Request Created}"

# Append the pull request summary to the workflow run summary. The files and
# checks links are sub-pages of the pull request, derived from its URL.
{
  printf -- '### %s\n\n' "${HEADING}"
  printf -- '- URL: %s\n' "${PULL_REQUEST_URL}"
  printf -- '- Files changed: %s/files\n' "${PULL_REQUEST_URL}"
  printf -- '- Checks: %s/checks\n' "${PULL_REQUEST_URL}"
} >>"${GITHUB_STEP_SUMMARY}"
