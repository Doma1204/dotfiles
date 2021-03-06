# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/lammanhei/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	# git
	# zsh-autosuggestions
	# vi-mode
	git-open
)

EDITOR=vim
export EDITOR

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# own stuff

#alias definition
alias szsh='source ~/.zshrc'

# directory alias
source ~/.directory_alias
alias home='cd ~'
alias volume='cd /Volumes'
alias o='open .'

alias m='make'
alias a.out='./a.out'
alias code='code .'

alias path='echo $PATH | tr -s ":" "\n"'

alias sls='ls -lah'
alias listporttty='ls /dev/tty.*'
alias listportcu='ls /dev/cu.*'
function listport() {
	ls /dev/$1.*
}

alias clearvs='find . -name .vscode -type d -print -exec rm -r {} +'
alias cleards='find . -name .DS_Store  -print -exec rm -r {} +'

alias go='git open'
alias lg=lazygit

# virtual python environment alias
alias create_venv='python3 -m venv .'
alias vpy='source ./bin/activate && which python3'
alias exitv='deactivate'
alias py=python3
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias hc='python3 -m hc05config' # HC-05 Bluetooth Configuration Tool
alias wp='which python'
alias wp3='which python3'

# ls related stuff
function chpwd() {
    emulate -L zsh
    ls
}

alias toggleBlue='blueutil -p toggle'

function hssh() {
	ssh $1@192.168.1.$2
}

# qmk related function and aliases
alias qm='qmk compile -kb gh60/doma -km joseph'

function qmkenv() {
	open -a "QMK Toolbox"
	cd ~/Programing/qmk_firmware/keyboards/gh60/doma/keymaps/joseph
	code -n ./keymap.c
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function conv(){
	for i in *.mov;
		do name=`echo "$i" | cut -d'.' -f1`
		echo "$name"
		ffmpeg -i "$i" -q:a 0 -map a "${name}.mp3"
	done
}