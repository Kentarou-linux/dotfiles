# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

export ZSH="/home/kebab/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


setopt autocd              # change directory just by typing its name
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt histignorealldups
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
#bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
autoload -Uz compinit
autoload -Uz colors
colors
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    #zstyle ':completion:*' list-colors "exfxcxdxbxegedabagacad"
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
   # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
   ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

#追加設定
#--------------------------------------------------------------------------------------

prompt_context() {
  local user=`whoami`@`hostname`

  if [[ "$user" != "root" || -n "$SSH_CONNECTION" ]]; then
   # prompt_segment black yellow " %(!.%{%F{black}%}.)$user "
    prompt_segment black red " %(!.%{%F{black}%}.)$user "
  else
    prompt_segment red red " %(!.%{%F{%}.) $user "
  fi
}

# PROMPT='
#%{%f%b%k%}$(build_prompt)
# %B%F{yellow}❯❯%f%b '

 PROMPT='
%{%f%b%k%}$(build_prompt)
 %B%F{red}❯❯%f%b '

chpwd() { ls }
set opt auto_pushd
export PAGER=most
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/home/kentarou/.config/nvim/
export PATH=$PATH:/home/kentarou/eclipse/java-2021-03/eclipse
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=$LANG
#export LANG=ja_JP.UTF-8

alias c="clear"
alias -g G="|grep"
alias user="ssh root@192.168.1.34"
alias 2="terminator -l 2 && exit"
alias 3="terminator -l 3 && exit"
alias 4="terminator -l 4 && exit"
alias dev="terminator -l dev && exit"
alias dev2="terminator -l dev2 && exit"
alias init.vim="nvim ~/.config/nvim/init.vim"
alias dein.toml="nvim ~/.config/nvim/dein.toml"
alias status="systemctl status"
alias start="systemctl start"
alias stop="systemctl stop"
alias restart="systemctl restart"
alias vim="nvim"
#alias blue="gnome-control-center bluetooth"
#alias blue="bluetoothctl connect 00:00:00:00:58:CA
alias e="exit"
alias wifi="nmcli device wifi list"
alias ma="cd eclipse-workspace/Mahjong_test/src/test"
#google検索
gs() {
    google-chrome https://www.google.com/search?q="$*&hl=en"
}

#google翻訳
gt() {
    echo -n "$*" ": ">> ~/.eng_history &&
    trans -b :ja "$*" | tee -a ~/.eng_history 
}

# gt() {
#    trans -b :ja "$*"
# }

error() {
    $* |& read -d'あ' error ; gt $error
}

blue(){
    bluetoothctl connect 00:00:00:00:58:CA
    result=`echo $?`
    if [ $result -eq 0 ]
    then
        exit
    fi
}




