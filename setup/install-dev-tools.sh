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
  htop \
  jq \
  k3d \
  kubectx \
  kubernetes-cli \
  lazygit \
  neovim \
  node@20 \
  ranger \
  ripgrep \
  stern \
  temporal \
  tfenv \
  tig \
  watch \
  xclip \
  yt-dlp \
  z
