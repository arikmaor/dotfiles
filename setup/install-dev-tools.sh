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
  fd \
  ranger \
  xclip \
  jq \
  htop \
  btop \
  neovim \
  tfenv \
  watch \
  stern \
  kubernetes-cli \
  kubectx \
  lazygit \
  node@20 \
  k3d \
  youtube-dl \
  temporal
