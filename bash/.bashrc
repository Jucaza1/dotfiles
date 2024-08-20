#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias walls='killall script_wall.sh; ~/wall/script_wall.sh &'
alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias icat="kitten icat"
alias py='python3'
alias deactivated='source $VIRTUAL_ENV/bin/activate; deactivate'
alias fv='(file=$(fzf); \[ -n "$file" \]; nvim $file)'
#alias pip='python3 -m pip'

PS1='[\u@\h \W]\$ '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\u@\h:\w\t \$\n'
eval "$(starship init bash)"
PATH=$PATH:~/.local/nvim-linux64/bin/
PATH=$PATH:~/.local/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

mkcd(){
    mkdir -- "$1" && cd -- "$1"
}

