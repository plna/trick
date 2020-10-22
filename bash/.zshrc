###################################

certprobe(){
    curl -s https://crt.sh/\?q=\%.$1\&output\=json  | jq -r '.[].name_value' | sed 's/\*\.//g' | grep $1 | sort -u | httprobe #| tee -a ./all.txt
}

certspotter(){
    curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins


crtsh(){
    curl -s https://crt.sh/\?q=\%.$1\&output\=json  | jq -r '.[].name_value' | sed 's/\*\.//g' | grep $1 | sort -u
}

response(){
echo "Gathering Response"       
        for x in $(cat alive)
do
        NAME=$(echo $x | awk -F/ '{print $3}')
        curl -X GET -H "X-Forwarded-For: evil.com" $x -I > "headers/$NAME" 
        curl -s -X GET -H "X-Forwarded-For: evil.com" -L $x > "responsebody/$NAME"
done
}

findd(){
    echo "Finding..."
    find . -type d -name "$1"
}

findf(){
    echo "Finding..."
    find . -type f -name "$1"
}
#######################################



# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ubuntu/.oh-my-zsh"

export COLORTERM="truecolor"





# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster2"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
unalias gau
unalias gf
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python="python3"
# alias pip="pip3"
alias expl="explorer.exe ."
alias lc="colorls -A --gs --sd"
alias lcl="colorls -Al --sd"
alias lct="colorls --sd --tree"
alias sublist3r="python3 ~/tools/Sublist3r/sublist3r.py"
alias dirs="~/tools/dirsearch/dirsearch.py"
alias wcl='wc -l'
alias rm="trash"

prompt_context(){}


export GOPATH=$HOME/go
export PATH=$PATH:/home/ubuntu/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/snap/bin
#export DISPLAY=localhost:0.0


#export http_proxy=139.99.102.114:80
#export https_proxy=139.99.102.114:80
#export no_proxy=localhost,127.0.0.1


autoload -U compaudit && compinit


# bindkey

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `userpath` on 2020-08-24 14:12:06
export PATH="$PATH:/home/ubuntu/.local/bin"
