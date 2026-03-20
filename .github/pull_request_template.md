## 📝 Summary

<!-- Short explanation of what changed and why. -->

## 🎯 Type of change

<!-- Check applicable options. -->

- [ ] 🐞 Bug fix (non-breaking change that fixes an issue)
- [ ] ✨ New feature (non-breaking change that adds functionality)
- [ ] ⚠️ Breaking change (fix or feature that would cause existing users to change their configuration or behavior)

## ✅ Checklist

- [ ] Title follows [Conventional Commits](https://www.conventionalcommits.org/) (e.g. `feat:`, `fix:`, `docs:`)
- [ ] CI / pre-commit hooks pass locally (`pre-commit run --all-files`) or I am relying on GitHub Actions to validate
- [ ] If I changed `.tf` interfaces or provider requirements, I ran **`terraform-docs`** / the `terraform_docs` pre-commit hook and **only** the `<!-- BEGIN_TF_DOCS -->` … `<!-- END_TF_DOCS -->` section of [README.md](README.md) reflects generated output
- [ ] I updated contributor-facing docs (for example [CONTRIBUTING.md](CONTRIBUTING.md)) when the change warranted it

## 🧪 Testing

<!-- How you validated the change (plan/apply, tests, manual steps). Omit secrets. -->

## 🔗 Related issues

<!-- Link issues with Closes #123 or Fixes #456 if applicable. -->
