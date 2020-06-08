# Path to your oh-my-zsh installation.
export ZSH="/home/chuck/.oh-my-zsh"
export GPG_FINGERPRINT="FFF55B4599ACC743B0390AB190F44AFF5EAF1476"
export KEYTIMEOUT=1
export ATHAME_ENABLED=0
export ATHAME_SHOW_MODE=0
export POWERLEVEL9K_MODE='nerdfont-complete'
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0
export TERM="xterm-256color"

path+=('/home/chuck/.cargo/bin')
path+=('/home/chuck/.local/bin')
path+=('/home/chuck/.local/scripts')
path+=('/home/chuck/.gem/ruby/2.5.0/bin')
path+=('/home/chuck/.gem/ruby/2.6.0/bin')

fpath=(~/.local/share/zsh $fpath)

ZSH_THEME="avit"

# Plugins
plugins=(
git
vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Local lib
# export "LD_LIBRARY_PATH=$HOME/.local/src/dbg:$HOME/.local/src/list:$HOME/.local/src/darray:$HOME/.local/src/bezier:$HOME/.local/lib"

export "LD_LIBRARY_PATH=$HOME/.local/lib"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

function zle-keymap-select zle-line-init
{
    # change cursor shape
    if [[ -n "$TMUX" ]]; then  # tmux
      case $KEYMAP in
          vicmd)      print -n '\033[0 q';; # block cursor
          viins|main) print -n '\033[6 q';; # line cursor
      esac
    else # iTerm2
      case $KEYMAP in 
          vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
          viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
      esac
    fi

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    if [[ -n "$TMUX" ]]; then # tmux
      print -n -- '\033[0 q'  # block cursor
    else # iTerm2
      print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
    fi
  }

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# unset zle_bracketed_paste

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

alias fr='cd ~/Projects/forgerock/'
alias devtools='cd ~/Projects/forgerock/saas/devtools'
alias orgui='cd ~/Projects/forgerock/saas/services/org-ui'
alias gateway='cd ~/Projects/forgerock/saas/services/org-gateway'
alias so='source ~/.zshrc'
alias login='cd ~/Projects/forgerock/platform-ui/packages/platform-login'
alias enduser='cd ~/Projects/forgerock/platform-ui/packages/platform-enduser'
alias admin='cd ~/Projects/forgerock/platform-ui/packages/platform-admin'
alias dy='cd ~/Projects/smithco/david-yurman/site-redesign'

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# The next line enables shell command completion for gcloud.
  if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export YVM_DIR=/home/chuck/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chuck/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/chuck/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/chuck/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/chuck/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
