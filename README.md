# publish-pull-request-summary

A composite action that publishes a summary of a pull request to the workflow run summary.

## Usage

```yaml
- name: Publish Pull Request Summary
  uses: craigsloggett/publish-pull-request-summary@v1
  with:
    url: ${{ steps.create-pull-request.outputs.url }}
```

The action appends a section to the workflow run summary (`$GITHUB_STEP_SUMMARY`) with links to the pull request, its changed files, and its checks:

```markdown
### Pull Request Created

- URL: https://github.com/owner/repo/pull/1
- Files changed: https://github.com/owner/repo/pull/1/files
- Checks: https://github.com/owner/repo/pull/1/checks
```

## Inputs

| Input     | Required | Default                | Description                               |
| --------- | -------- | ---------------------- | ----------------------------------------- |
| `url`     | Yes      |                        | The URL of the pull request to summarize. |
| `heading` | No       | `Pull Request Created` | The heading for the summary section.      |
