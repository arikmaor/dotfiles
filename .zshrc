source /usr/local/share/antigen/antigen.zsh

export DEFAULT_USER=arik

antigen use oh-my-zsh
antigen theme agnoster

antigen bundles <<EOBUNDLES
  git
  z
  osx
EOBUNDLES

antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

alias git=hub