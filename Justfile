export TENV_AUTO_INSTALL := "true"

setup:
  brew bundle install
  tenv tofu install
  tofu version
