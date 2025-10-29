# zsh completions - troubleshooting: https://docs.brew.sh/Shell-Completion
autoload -Uz compinit
compinit

source ~/.local/share/antigen.zsh

export DEFAULT_USER=arikmaor # for agnoster theme
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

# export DOTNET_ROOT=$HOME/.dotnet
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/opt/homebrew/opt/node@20/bin":$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools:"$HOME/JetBrains Rider-2024.3.6/bin"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/arikmaor/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi
