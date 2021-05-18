typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# POWERLEVEL9K_TIME_BACKGROUND="none"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=9

alias ls='exa -a -F --color=always --group-directories-first'
alias ll='exa -l -a -F --color=always --group-directories-first --git'
alias la='exa -a -a -F --color=always --group-directories-first'
alias brightnessctl='sudo brightnessctl'
alias hotp='htop'
alias py='python'
alias k='kubectl'

# menu function
zstyle ':completion:*' menu select
# allow short path input (like cd /u/sh -> cd /use/share)
# autoload -U compinit && compinit
# hashes
hash -d screen=/home/qkation/Pictures/screenshots
# ignore dublicates in history
setopt HIST_IGNORE_DUPS

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /home/qkation/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(zsh-autosuggestions)

# syntax highlighting like in Fish
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Bind keys:
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word #ctrl+right

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory # Append history to the history file (no overwriting)
# setopt sharehistory #Share history across terminals
setopt incappendhistory # Immediately append to the history file, not just when a term is kill
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/qkation/deleteIt/google-cloud-sdk/path.zsh.inc' ]; then . '/home/qkation/deleteIt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/qkation/deleteIt/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/qkation/deleteIt/google-cloud-sdk/completion.zsh.inc'; fi
