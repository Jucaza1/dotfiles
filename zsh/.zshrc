# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user-j/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias walls='killall script_wall.sh; ~/wall/script_wall.sh &'
alias vim='nvim'
alias vi='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias icat="kitten icat"
alias py='python3'
alias deactivated='source $VIRTUAL_ENV/bin/activate; deactivate'
alias fv='(file=$(fzf); \[ -n "$file" \]; nvim $file)'
alias fd='fdfind'
#alias pip='python3 -m pip'
alias docker-desk='systemctl --user start docker-desktop'

#PS1='[\u@\h \W]\$ '
PS1='%n@%m %T$ '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\u@\h:\w\t \$\n'
eval "$(starship init zsh)"
PATH=$PATH:~/.local/nvim-linux64/bin/
PATH=$PATH:~/.local/
PATH=$PATH:~/.local/bin

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

mkcd(){
    mkdir -- "$1" && cd -- "$1"
}
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
TMOUT=0
export PATH=$PATH:~/.local/share/applications/Postman
. "$HOME/.asdf/asdf.sh"

