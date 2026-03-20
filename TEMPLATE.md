# 🧱 Using this template

After **Use this template** on GitHub, complete the following so CI, releases, and docs match your fork.

## ⚙️ Repository settings

1. **Default branch** must be `main` (or update [`.github/workflows/ci.yml`](.github/workflows/ci.yml), [`.github/workflows/release-please.yml`](.github/workflows/release-please.yml), and [`.github/workflows/semantic-pr.yml`](.github/workflows/semantic-pr.yml) to match your branch name).
2. **Actions**: enable GitHub Actions for the new repository.
3. **Squash merging policy (recommended):**
   - Set the default merge method to **Squash and merge** in your repo settings.
   - Set the default squash **commit message** to **Pull request title**.

   These settings help keep merge commit subjects aligned with your PR titles, which your conventional-commit workflows rely on.

## 🧩 Replace placeholders

| Location | Replace |
|----------|---------|
| [README.md](README.md) | `hlvtechnologies/terraform-meraki-organization` in the Usage example |
| [CHANGELOG.md](CHANGELOG.md) | Release Please replaces this file’s contents when releases run (keep the file in the repo) |
| [variables.tf](variables.tf) | Default `org_name` if you do not want a template-specific default |
| [LICENSE](LICENSE) | Copyright line if a different legal entity owns the fork |

## 👩‍💻 Contributor experience

- Use [`.pre-commit-config.yaml`](.pre-commit-config.yaml) locally (the CI workflow runs the same hooks with `pre-commit run --all-files`).
- PR titles are validated by [`.github/workflows/semantic-pr.yml`](.github/workflows/semantic-pr.yml) using Conventional Commits.
- Reviewers should expect README API tables to be generated between `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->`.

## 🚀 Release Please (`RELEASE_PLEASE_TOKEN`)

The [Release Please workflow](.github/workflows/release-please.yml) uses a personal access token so releases and follow-up automation behave like a normal user (the default `GITHUB_TOKEN` does not trigger `release: published` for other workflows).

1. Create a **fine-grained** or **classic** PAT with access to this repository:
   - **Contents**: read and write
   - **Pull requests**: read and write
   - Add **Workflow** if other workflows must run on events triggered by this token
2. In the repo: **Settings → Secrets and variables → Actions**, add `RELEASE_PLEASE_TOKEN` with that PAT.

If you omit this secret, the Release Please job will fail until you add it or change the workflow to use `token: ${{ secrets.GITHUB_TOKEN }}` (with the limitations above).

## 🥇 First release (`0.1.0`)

[`.release-please-manifest.json`](.release-please-manifest.json) starts at `0.0.0` (no prior release). Merge Conventional Commit messages on `main` (`feat:`, `fix:`, etc.); Release Please will open a release PR. The first meaningful release is often **`0.1.0`** after a `feat:` merge. Adjust the Usage `version = "~> 0.1"` line in [README.md](README.md) only if your first tag uses a different minor line.

## 💻 Local development

- Install [pre-commit](https://pre-commit.com/) and run `pre-commit install` and `pre-commit run --all-files`.
- OpenTofu version: see [`.opentofu-version`](.opentofu-version).
