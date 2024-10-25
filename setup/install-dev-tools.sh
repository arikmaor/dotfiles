echo Removing gh installed by apt
apt remove gh

echo Installing tmux Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Running brew install
brew install \
  gcc \
  fzf \
  ripgrep \
  z \
  tig \
  golang \
  the_silver_searcher \
  fd \
  ranger \
  jq \
  hub \
  htop \
  btop \
  neovim \
  tfenv \
  watch \
  stern \
  kubernetes-cli \
  kubectx \
  lazygit \
  k3d \
  fnm \
  mongosh \
  youtube-dl \
  temporal

