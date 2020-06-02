source /usr/local/share/antigen/antigen.zsh

export DEFAULT_USER=arik # for anoster theme

antigen use oh-my-zsh
antigen theme agnoster

antigen bundles <<EOBUNDLES
  git
  z
  osx
  zsh-users/zsh-syntax-highlighting
  docker
EOBUNDLES

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(direnv hook zsh)"

alias git=hub
