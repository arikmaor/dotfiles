FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source <(kubectl completion zsh)

export PYTHON_CONFIGURE_OPTS="--enable-framework"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(direnv hook zsh)"

source /opt/homebrew/share/antigen/antigen.zsh
export DEFAULT_USER=arik # for agnoster theme

export EDITOR=nvim
export KUBE_EDITOR=nvim

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

export PATH="${PATH}:${HOME}/.krew/bin"

RPROMPT=$'%{$fg[white]%}$(tf_prompt_info)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/projects/leatherman/source-me.sh ] && source ~/projects/leatherman/source-me.sh


alias git=hub
alias vim=nvim
alias t=terraform
alias k=kubectl
alias kctx=kubectx
alias kns=kubens

alias argo='argo --context gke_tensorleap-ops3_us-central1-c_ops-cluster -n argo'

alias al='argo list --context gke_tensorleap-ops3_us-central1-c_ops-cluster | tail -n +2 | fzf --preview='\''echo {} | cut -f 1 -d " " | xargs argo watch --context gke_tensorleap-ops3_us-central1-c_ops-cluster '\'' | cut -f 1 -d " " | xargs argo logs --context gke_tensorleap-ops3_us-central1-c_ops-cluster -f '
alias alr='argo list --running --context gke_tensorleap-ops3_us-central1-c_ops-cluster | tail -n +2 | fzf --preview='\''echo {} | cut -f 1 -d " " | xargs argo watch --context gke_tensorleap-ops3_us-central1-c_ops-cluster '\'' | cut -f 1 -d " " | xargs argo logs --context gke_tensorleap-ops3_us-central1-c_ops-cluster -f '

gctx() {
  gcloud config set project $(gcloud projects list --format=json | jq -r  '.[].projectId' | fzf)
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

gfix() {
  rev=$1

  if [[ -z $rev ]]; then
    rev=$(git log --oneline | fzf --reverse --height=10 | cut -d ' ' -f 1)
  fi

  if [[ -z $rev ]]; then
    return 0
  fi

  git commit --fixup $rev

  CHANGED=$(git diff-index --name-only HEAD --)
  if [[ -n $CHANGED ]]; then
    git stash push
  fi

  git rebase --autostash -i $rev^

  if [[ -n $CHANGED ]]; then
    git stash pop
  fi
}
