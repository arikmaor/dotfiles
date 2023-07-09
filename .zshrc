BREW_PREFIX=$(brew --prefix)
FPATH="$BREW_PREFIX/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
  [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -s "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ] && source "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
[ -s "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ] && source "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
[ -s kubectl ] && source <(kubectl completion zsh)
[ -s k3d ] && source <(k3d completion zsh)

export PYTHON_CONFIGURE_OPTS="--enable-framework"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv init --path)"
fi

source $BREW_PREFIX/share/antigen/antigen.zsh
export DEFAULT_USER=arik # for agnoster theme

export EDITOR=nvim
export KUBE_EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True


antigen use oh-my-zsh
antigen theme agnoster

antigen bundles <<EOBUNDLES
  git
  z
  macos
  zsh-users/zsh-syntax-highlighting
  docker
  terraform
EOBUNDLES

antigen apply

export PATH="${PATH}:${HOME}/.krew/bin:$(go env GOPATH)/bin:${HOME}/.local/bin"

RPROMPT=$'%{$fg[white]%}$(tf_prompt_info)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/projects/leatherman/source-me.sh ] && source ~/projects/leatherman/source-me.sh


alias git=hub
alias vim=nvim
alias t=terraform
alias k=kubectl
alias kctx=kubectx
alias kns=kubens
alias mux=tmuxinator
alias o='fzf_tmuxinator_project'

fzf_tmuxinator_project() {
  local proj=$(tmuxinator list -n | tail -n +2 | fzf)
  tmuxinator start $proj
}

f3() {
  if [[ "$1" == '' ]]; then
    gcs_path=$(gsutil ls $1 | fzf --tac)
  else
    gcs_path=$((echo '..' && gsutil ls $1) | fzf --tac)
  fi

  if [[ "$gcs_path" == '..' ]]; then
    gcs_path=$(dirname $1)/
  fi

  if [[ "$gcs_path" == 'gs:/' ]]; then
    f3
  elif [[ "$gcs_path" =~ '^.*/$' ]]; then
    f3 $gcs_path
  elif [[ "$gcs_path" != '' ]]; then
    echo $gcs_path
  fi
}

