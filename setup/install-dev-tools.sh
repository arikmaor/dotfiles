echo Removing gh installed by apt
sudo apt remove gh

echo Installing tmux Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Running brew install
brew install \
  btop \
  fd \
  fzf \
  gcc \
  golang \
  node@20 \
  htop \
  jq \
  yq \
  k3d \
  k9s \
  kubectx \
  kubernetes-cli \
  gh \
  lazygit \
  ripgrep \
  neovim \
  node@20 \
  postgresql \
  ranger \
  ripgrep \
  stern \
  temporal \
  tfenv \
  tig \
  tree \
  watch \
  xclip \
  yt-dlp \
  z
