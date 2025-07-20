# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    aliases
    poetry
    zsh-completions
    # asdf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jucaza/.zshrc'
zstyle ':completion:*' menu select

export EDITOR='nvim'
autoload -Uz compinit
compinit
# End of lines added by compinstall
alias walls='killall script_wall.sh; ~/wall/script_wall.sh &'
alias vim='nvim'
# alias vi='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias icat="kitten icat"
alias py='python3'
alias deactivated='source $VIRTUAL_ENV/bin/activate; deactivate'
alias fv='(file=$(fzf); \[ -n "$file" \]; nvim $file)'
alias fd='fdfind'
#alias pip='python3 -m pip'
alias docker-desk='systemctl --user start docker-desktop'
alias wallpaper='ls ~/wall/ | fzf --preview="feh --bg-scale ~/wall/{}" | xargs -I {} feh --bg-scale ~/wall/{}'
alias bright85='xrandr --output DP-4 --brightness 0.85'
alias postman-det='Postman > /dev/null 2>&1 & disown'


#PS1='[\u@\h \W]\$ '
PS1='%n@%m %T$ '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\u@\h:\w\t \$\n'
eval "$(starship init zsh)"
# PATH=$PATH:~/.local/nvim-linux64/bin/
PATH=$PATH:~/.local/nvim-linux-x86_64/bin/
PATH=$PATH:~/.local/
PATH=$PATH:~/.local/bin

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
bright(){
    xrandr --output DP-4 --brightness "$1"
}
mkcd(){
    mkdir -- "$1" && cd -- "$1"
}

## Rust ----><----
#
#Install and build on save
cwi(){
    cargo watch -x "install --path ."
}
#Run example from with name = 1st argument
cwe(){
    cargo watch -q -c -x "run -q --example '$1'"
}
#Run test
# -1 argument  -> test by function_name
# -2 arguments -> test by file_name function_name
cwt(){
    if [$# -eq 1]; then
        cargo watch -q -c -x "test '$1' -- --nocapture"
    elif [$# -eq 2]; then
        cargo watch -q -c -x "test '$1' '$2' -- --nocapture"
    else
        cargo watch -q -c -x "test -- --nocapture"
    fi
}

source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/../bin
TMOUT=0
export PATH=$PATH:~/.local/share/applications/Postman
. "$HOME/.asdf/asdf.sh"
. ~/.asdf/plugins/java/set-java-home.zsh
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PYTHONPATH="/usr/lib/local/lib/python3.11/dist-packages"

export DOCKER_HOST=unix:///var/run/docker.sock
alias idea="~/idea-IC-251.23774.435/bin/idea"
# idea snap
export PATH=$PATH:/snap/bin
fpath+=~/.zfunc
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
