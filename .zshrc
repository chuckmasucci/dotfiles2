# Path to your oh-my-zsh installation.
export ZSH="/home/chuck/.oh-my-zsh"
export GPG_FINGERPRINT="FFF55B4599ACC743B0390AB190F44AFF5EAF1476"

path+=('/home/chuck/.cargo/bin')
path+=('/home/chuck/.local/bin')
path+=('/home/chuck/.gem/ruby/2.5.0/bin')

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Base 16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
    #     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    #     eval "$("$BASE16_SHELL/profile_helper.sh")"


function wrap-for-tmux {
    local string=${1}
    local tmux_start="\EPtmux;"
    local tmux_end="\E\\"
    local ESC="\E"
    print -n -- $tmux_start${string//$ESC/$ESC$ESC}$tmux_end
}

cursor_block="\E]50;CursorShape=0\C-G"
cursor_line="\E]50;CursorShape=1\C-G"

if [[ -n $TMUX ]]; then
    cursor_block=$(wrap-for-tmux $cursor_block)
    cursor_line=$(wrap-for-tmux $cursor_line)
fi

function zle-keymap-select zle-line-init
{
    case $KEYMAP in
        vicmd)      print -n -- "$cursor_block";;  # block cursor
        viins|main) print -n -- "$cursor_line";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
export KEYTIMEOUT=1

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

alias fr='cd ~/Projects/forgerock/'
alias orgui='cd ~/Projects/forgerock/saas/services/org-ui'
alias so='source ~/.zshrc'

source /usr/share/nvm/init-nvm.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chuck/.local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/chuck/.local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/chuck/.local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/chuck/.local/bin/google-cloud-sdk/completion.zsh.inc'; fi
