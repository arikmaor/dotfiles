# New Pop!\_OS Installation

1. Set machine name: `sudo hostnamectl set-hostname [WANTED MACHINE NAME]`
1. Run basic setup script: `/bin/bash -c "$(curl -fsSL https://github.com/arikmaor/dotfiles/blob/master/setup/basic-setup.sh)"`.
1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
1. Clone this repo: `git clone git@github.com:arikmaor/dotfiles.git ~/dotfiles`.
1. Set zsh as the default shell: `chsh -s $(which zsh)`
1. Restart (at this point _Alacritty_ and _Brave_ are installed)
1. Run `stow base pop-os`
1. Install dev tools: `~/dotfiles/setup/install-dev-tools.sh`.
1. Login to github and create ssh key: `gh auth login`
1. Install applications: `~/dotfiles/setup/install-desktop-apps.sh`.
1. Configure osx: `~/dotfiles/setup/pop-os-settings.sh`.
