# New Pop!\_OS Installation

1. Set machine name: `sudo hostnamectl set-hostname [WANTED MACHINE NAME]`
1. Run basic setup script: `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/arikmaor/dotfiles/refs/heads/master/setup/basic-setup.sh)"`.
1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
1. Set zsh as the default shell: `chsh -s $(which zsh)`
1. Restart (at this point _Alacritty_ and _Brave_ are installed)
1. Open _Brave Browser_ and start syncing
1. Login to github and create ssh key: `gh auth login`
1. Clone this repo: `git clone git@github.com:arikmaor/dotfiles.git ~/dotfiles`.
1. Run `stow base pop-os` in `~/dotfiles`
1. Restart _Alacritty_
1. Configure system settings: `~/dotfiles/setup/pop-os-settings.sh`.
1. Install applications: `~/dotfiles/setup/install-desktop-apps.sh`.
1. Install dev tools: `~/dotfiles/setup/install-dev-tools.sh`.
1. Restart _Alacritty_ and install tmux plugins (`prefix + I`)
1. Open neovim and let the plugin manager install everything
1. Install Docker: `sudo /bin/bash -c "$(curl -fsSL https://get.docker.com)"` then set user permissiosn with `sudo usermod -aG docker $USER && newgrp docker`.
1. [Setup KMonad](../kmonad/INSTALL.md)
