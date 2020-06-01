# dotfiles

## New machine setup
1. Install command line developer tools: `xcode-select --install`
2. Install homebrew: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. Clone this repo: `git clone https://github.com/arikmaor/dotfiles.git ~/.dotfiles`
4. Run scripts from `./setup`
5. [Generate an ssh key for github](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) then run `pbcopy < ~/.ssh/id_rsa.pub` and paste [here](https://github.com/settings/keys)