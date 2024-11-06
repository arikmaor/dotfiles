FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

autoload -Uz compinit
compinit

source ~/.local/share/antigen.zsh
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
  memark/zsh-dotnet-completion
EOBUNDLES

antigen apply

if command -v fzf > /dev/null; then
  source <(fzf --zsh)
fi

RPROMPT=$'%{$fg[white]%}$(tf_prompt_info)%{$reset_color%}'

export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

alias vim=nvim
alias k=kubectl
alias kctx=kubectx
alias kns=kubens

alias azg='az fzf group'
alias azl='az fzf location'
alias azs='az fzf subscription'
