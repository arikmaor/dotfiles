# MacOS Installation

1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
1. Install stuff with homebrew: `/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/arikmaor/dotfiles/refs/heads/master/setup/mac-homebrew.sh)"`.
1. Open _Brave Browser_ and start syncing
1. Login to github and create ssh key: `gh auth login`
1. Clone this repo: `git clone git@github.com:arikmaor/dotfiles.git ~/dotfiles`.
1. Run `stow base fonts mac` in `~/dotfiles`
1. Restart _Alacritty_
1. Configure system settings: `~/dotfiles/setup/mac-settings.sh`.
1. Install Nodejs using script from [here](https://nodejs.org/en/download) according to your needs
1. Start tmux and install plugins (`prefix + I`)
1. Open neovim and let the plugin manager install everything
