# 🤝 Contributing

Thanks for helping improve this module. This document is a lightweight guide for issues and pull requests.

## 🐛 Reporting issues

Use the GitHub **issue templates** when possible ([bug report](.github/ISSUE_TEMPLATE/bug_report.yml), [feature request](.github/ISSUE_TEMPLATE/feature_request.yml)). Include:

- What you expected vs what happened
- OpenTofu or Terraform version and how you invoke it
- A minimal module snippet (redact secrets and organization identifiers)

## 🔁 Pull requests

1. **Branch:** open PRs against **`main`**.
2. **Title:** follow [Conventional Commits](https://www.conventionalcommits.org/) (for example `feat:`, `fix:`, `docs:`). PRs to `main` are checked by [`.github/workflows/semantic-pr.yml`](.github/workflows/semantic-pr.yml); squash merges should keep that title as the merged commit subject when possible.
3. **Checks:** CI runs the same hooks as [`.pre-commit-config.yaml`](.pre-commit-config.yaml) (`pre-commit run --all-files`). Fix failures locally when you can:

```bash
pip install pre-commit
pre-commit install
pre-commit install --hook-type commit-msg
pre-commit run --all-files
```

4. **OpenTofu:** match the version in [`.opentofu-version`](.opentofu-version) when reproducing or formatting, or note the version you used in the PR description.
5. **Docs:** generated API tables live between `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->` in [README.md](README.md). Run the `terraform_docs` hook (or `terraform-docs` with [`.terraform-docs.yaml`](.terraform-docs.yaml)) after changing variables or resources. The **Usage** example and **version** line above that block are maintained manually and by [Release Please](https://github.com/googleapis/release-please); avoid editing auto-generated tables by hand.

## 🏷️ Releases and versioning

Versioning and [CHANGELOG.md](CHANGELOG.md) are handled by Release Please on `main` (see [TEMPLATE.md](TEMPLATE.md) for maintainer setup). Contributors do not need to bump versions in release PRs beyond what Release Please proposes.

## 📄 License

By contributing, you agree that your contributions are licensed under the same terms as this project ([MIT](LICENSE)).
