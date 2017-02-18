# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"
#ZSH_THEME="kardan"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
#ZSH_THEME="amuse"
#ZSH_THEME="odin"
#ZSH_THEME="hyperzsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive compl scdl;lllllllll/zetion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode history tmux zsh-autosuggestions zsh-bd alias-tips sublime scd  git zsh-syntax-highlighting wd history-substring-search last-working-dir)

# User configuration

 export PATH="/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export PATH="/apollo/env/SDETools/bin:$PATH"
export PATH="/Users/keliz/Tools/groovy-2.4.6/bin:$PATH"
alias sshdev="ssh keliz-5.desktop.amazon.com"
alias ssha="ssh keliz.aka.corp.amazon.com"
alias sshtimber="ssh ams-timber-cn.aka.pek.amazon.com"
alias sshtimbereu="ssh ams-timberfs.aka.dub.amazon.com"
alias bb="brazil-build"
alias bbp="brazil-build apollo-pkg"
alias bbs="brazil-build server"
alias bbc="brazil-build clean"
alias bbr="brazil-build release"
alias bbt="brazil-build test"
alias cdws="cd ~/workplace"
#alias cat="pygmentize -g"
export PATH="/Users/keliz/workspace/AmaSSH/src/AmaSSH/scripts:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
alias emr="ssh -i ~/Documents/asin/keliz-oregon.pem ec2-54-200-51-243.us-west-2.compute.amazonaws.com"
alias -s gz='tar -xzvf'
alias odin="ssh -L 2009:localhost:2009 keliz-5.desktop.amazon.com -f -N"
alias sshmac="ssh keliz@3c15c2d26ac0.ant.amazon.com"
alias sshkrs="assh deepkrsdata-integ-2a-6264e85b.us-west-2.amazon.com"
alias brazil-pycharm="~/local/bin/brazil-python-env testrun open '/Applications/PyCharm CE.app'"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8


# zsh-bd
#. $HOME/.zsh/plugins/bd/bd.zsh
eval "$(pyenv virtualenv-init -)"
#source ~/.oh-my-zsh/plugins/incr*.zsh

eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
#pyenv virtual prompt
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

local VENV="\$(virtualenv_info)";
export PS1="${VENV}"
