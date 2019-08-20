# General
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

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=500000
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

# Completion
if [ -e /usr/local/share/zsh-completions ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi
setopt AUTO_MENU
setopt auto_param_keys
setopt list_types
setopt magic_equal_subst
setopt menu_complete
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh" # This loads nvm

# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:/usr/local/opt/curl/bin"
export PATH="$PATH:/usr/local/opt/openssl/bin"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
 eval "$(pyenv init -)"

# Powerline
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config
powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh # Python 2.7

# init
autoload -U compinit
compinit -u

