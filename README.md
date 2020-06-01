# dotfiles

## New machine setup
1. Install command line developer tools: `xcode-select --install`.
2. Install homebrew: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`.
3. Clone this repo: `git clone https://github.com/arikmaor/dotfiles.git ~/.dotfiles`.
4. Install applications: `~/.dotfiles/setup/apps.sh`.
5. Install developer tools: `~/.dotfiles/setup/devtools.sh`.
6. Create symlinks: `~/.dotfiles/setup/symlinks.sh`.
7. Generate an ssh key for github: `~/.dotfiles/setup/generate_ssh_key.sh {email}` then paste [here](https://github.com/settings/keys) the public key already in the clipboard.
8. Start installed [apps](setup/apps.sh) to make sure they start properly and login when neccessery.