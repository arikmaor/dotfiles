# ---------------------------------------------------------------------------
# Startup-cost notes:
#   - compinit runs ONCE, after every fpath contributor, and uses -C on the
#     fast path. It used to run twice with a full compaudit each time (~105ms).
#   - `fzf --zsh` / `fnm env` are cached to disk instead of forked every start;
#     the cache regenerates automatically when the tool binary is newer.
#   - brew shellenv is inlined statically in .zshenv (it forked twice).
# ---------------------------------------------------------------------------

# Cache a tool's shell-init output instead of forking it on every startup.
# Usage: zcache <name> <cmd> [args...]   Regenerates when <cmd> is newer.
# Force a refresh with: rm -rf ~/.cache/zsh-init
_ZCACHE_DIR=$HOME/.cache/zsh-init
[[ -d $_ZCACHE_DIR ]] || mkdir -p $_ZCACHE_DIR
zcache() {
  local name=$1; shift
  local out=$_ZCACHE_DIR/$name.zsh
  local bin=${commands[$1]}
  if [[ ! -s $out || ( -n $bin && $bin -nt $out ) ]]; then
    "$@" >| $out 2>/dev/null || return
  fi
  source $out
}

# --- fpath contributors: must all come BEFORE compinit ---------------------
# (brew's site-functions are added in .zshenv)
# Docker Desktop CLI completions
[[ -d $HOME/.docker/completions ]] && fpath=($HOME/.docker/completions $fpath)

# --- plugins ---------------------------------------------------------------
source ~/.local/share/antigen.zsh

export DEFAULT_USER=arik # for agnoster theme
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

# --- completions: single cached compinit, after all fpath additions --------
# Full compinit (with its compaudit security scan) at most once a day;
# otherwise -C trusts the existing dump and skips the scan.
autoload -Uz compinit
# The glob MUST be expanded in an array assignment: zsh does not perform
# filename generation inside [[ ]], so a (#q...) qualifier there is just a
# literal non-empty string and the test would always be true (always full
# compinit). (N)=null-glob, (.)=plain file, (mh-24)=modified in last 24h.
_zcompdump_fresh=( $HOME/.zcompdump(N.mh-24) )
if (( $#_zcompdump_fresh )); then
  compinit -C   # dump is recent: trust it, skip the compaudit security scan
else
  compinit      # missing or stale: full rebuild
fi
unset _zcompdump_fresh

# --- tools -----------------------------------------------------------------
command -v fzf >/dev/null && zcache fzf fzf --zsh

# fnm, deferred to first use. `fnm env` costs ~200ms and is NOT cacheable: it
# mints a unique per-shell FNM_MULTISHELL_PATH every call (1372 stale ones had
# piled up in ~/.local/state/fnm_multishells). So instead of paying it in every
# shell, wrap the node entry points and initialise on first call. Shells that
# never touch node pay nothing.
# To restore eager loading, replace this block with: eval "$(fnm env)"
if [[ -d /opt/homebrew/opt/fnm/bin ]]; then
  _fnm_init() {
    unfunction node npm npx corepack fnm 2>/dev/null
    eval "$(command fnm env)"
  }
  for _c in node npm npx corepack fnm; do
    functions[$_c]="_fnm_init; command $_c \"\$@\""
  done
  unset _c
fi

# --- environment -----------------------------------------------------------
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# export DOTNET_ROOT=$HOME/.dotnet
path=(${KREW_ROOT:-$HOME/.krew}/bin $path)
# Only append dotnet dirs when DOTNET_ROOT is actually set. Interpolating it
# while unset left empty ":" entries in PATH, which zsh reads as the current
# directory.
[[ -n $DOTNET_ROOT ]] && path+=($DOTNET_ROOT $DOTNET_ROOT/tools)
path=(/opt/homebrew/opt/postgresql@18/bin $path)
export PATH
