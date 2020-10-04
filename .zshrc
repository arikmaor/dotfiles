export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

GOOGLE_CLOUD_SDK_DIR="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
source "$GOOGLE_CLOUD_SDK_DIR/path.zsh.inc"
source "$GOOGLE_CLOUD_SDK_DIR/completion.zsh.inc"
source <(kubectl completion zsh)

export PYTHON_CONFIGURE_OPTS="--enable-framework"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(direnv hook zsh)"

source /usr/local/share/antigen/antigen.zsh
export DEFAULT_USER=arik # for agnoster theme

export KUBE_EDITOR=nvim

antigen use oh-my-zsh
antigen theme agnoster

antigen bundles <<EOBUNDLES
  git
  z
  osx
  zsh-users/zsh-syntax-highlighting
  docker
  terraform
EOBUNDLES

antigen apply

export PATH="${PATH}:${HOME}/.krew/bin"

RPROMPT=$'%{$fg[white]%}$(tf_prompt_info)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias git=hub
alias vim=nvim
alias t=terraform
alias k=kubectl
alias kctx=kubectx
alias kns=kubens

