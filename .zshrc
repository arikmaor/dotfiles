BREW_PREFIX=$(brew --prefix)
FPATH="$BREW_PREFIX/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

[ -s kubectl ] && source <(kubectl completion zsh)
[ -s k3d ] && source <(k3d completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $BREW_PREFIX/share/antigen/antigen.zsh
export DEFAULT_USER=arik # for agnoster theme

export EDITOR=nvim
export KUBE_EDITOR=nvim

antigen use oh-my-zsh
antigen theme agnoster

antigen bundles <<EOBUNDLES
  git
  z
  zsh-users/zsh-syntax-highlighting
  terraform
EOBUNDLES

antigen apply

export PATH="${PATH}:$(go env GOPATH)/bin"

RPROMPT=$'%{$fg[white]%}$(tf_prompt_info)%{$reset_color%}'

alias vim=nvim
alias k=kubectl
alias kctx=kubectx
alias kns=kubens
