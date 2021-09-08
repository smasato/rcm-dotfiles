if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# General
autoload -U compinit
compinit

export LANG=ja_JP.UTF-8
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt RM_STAR_WAIT
setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt print_eight_bit
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_param_slash
setopt mark_dirs

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=530000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt append_history
setopt inc_append_history
setopt hist_reduce_blanks

# anyframe
# https://qiita.com/mollifier/items/81b18c012d7841ab33c3
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ":anyframe:selector:" use peco # brew install peco
bindkey '^xb' anyframe-widget-cdr # 過去に移動したことのあるディレクトリに移動する
bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^xr' anyframe-widget-execute-history # コマンドライン履歴から選んで実行する
bindkey '^x^r' anyframe-widget-execute-history # コマンドライン履歴から選んで実行する
bindkey '^xp' anyframe-widget-put-history # コマンドライン履歴から選んでコマンドラインに挿入する
bindkey '^x^p' anyframe-widget-put-history # コマンドライン履歴から選んでコマンドラインに挿入する
bindkey '^xg' anyframe-widget-cd-ghq-repository # ghqコマンドで管理しているリポジトリに移動する
bindkey '^x^g' anyframe-widget-cd-ghq-repository # ghqコマンドで管理しているリポジトリに移動する
bindkey '^xk' anyframe-widget-kill # プロセスをkillする
bindkey '^x^k' anyframe-widget-kill # プロセスをkillする
bindkey '^xi' anyframe-widget-insert-git-branch # Gitブランチ名をコマンドラインに挿入する
bindkey '^x^i' anyframe-widget-insert-git-branch # Gitブランチ名をコマンドラインに挿入する
bindkey '^xf' anyframe-widget-insert-filename # ファイル名をコマンドラインに挿入する
bindkey '^x^f' anyframe-widget-insert-filename # ファイル名をコマンドラインに挿入する

if [ -d /Applications/Tailscale.app ]; then
  function tailscale-ip-list () {
    /Applications/Tailscale.app/Contents/MacOS/Tailscale status \
      | awk 'BEGIN{OFS="\t"}{print $1,$2}' \
      | anyframe-selector-auto \
      | awk '{print $1}' \
      | anyframe-action-insert
  }
  zle -N tailscale-ip-list
  bindkey '^xt' tailscale-ip-list
fi

# Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

setopt complete_in_word
setopt auto_menu
setopt auto_param_keys
setopt list_types
setopt magic_equal_subst
setopt always_last_prompt
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' insert-tab false

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto' # gnu ls

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh" # This loads nvm

# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"

if [ -d /usr/local/opt/llvm/ ]; then
  export PATH="$PATH:/usr/local/opt/llvm/bin"
fi

if [ -d /usr/local/opt/curl ]; then
  export PATH="$PATH:/usr/local/opt/curl/bin"
fi

if [ -d /usr/local/opt/openssl ]; then
  export PATH="$PATH:/usr/local/opt/openssl/bin"
fi

if [ -d $HOME/.cargo ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d /usr/local/opt/coreutils/ ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# google-cloud-sdk
if [ -d /usr/local/Caskroom/google-cloud-sdk ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# alias
alias reload="source $HOME/.zshrc && echo '~/.zshrc reloaded!'"
alias gs='git status'
alias c='clear'
alias el='exa'

if [ -d /usr/local/share/zsh-syntax-highlighting ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -d /usr/local/share/zsh-autosuggestions ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -d /usr/local/share/zsh-you-should-use ]; then
  source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
fi

if [ -e /usr/local/bin/jump ]; then
  eval "$(jump shell)"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
