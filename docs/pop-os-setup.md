# New Pop!\_OS Installation

1. Set machine name: `sudo hostnamectl set-hostname [WANTED MACHINE NAME]`
1. Run basic setup script: `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/arikmaor/dotfiles/refs/heads/master/setup/basic-setup.sh)"`.
1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
1. Set zsh as the default shell: `chsh -s $(which zsh)`
1. Restart (at this point _Alacritty_ and _Brave_ are installed)
1. Login to github and create ssh key: `gh auth login`
1. Clone this repo: `git clone git@github.com:arikmaor/dotfiles.git ~/dotfiles`.
1. Run `stow base pop-os` in `~/dotfiles`
1. Configure system settings: `~/dotfiles/setup/pop-os-settings.sh`.
1. Install dev tools: `~/dotfiles/setup/install-dev-tools.sh.sh`.
1. Install applications: `~/dotfiles/setup/install-desktop-apps.sh`.
1. Install Docker: `/bin/bash -c "$(https://get.docker.com)`.
1. [Setup KMonad](../kmonad/INSTALL.md)
