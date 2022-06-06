#  Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zmodload zsh/zprof


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git zsh-autosuggestions history-substring-search)


source $ZSH/oh-my-zsh.sh

# User configuration
export HOMEBREW_NO_AUTO_UPDATE=1
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)
export GIT_PATH="/Users/yu/Workspace/src"
export GOPATH="/Users/yu/Workspace"
export GOPROXY="https://mirrors.aliyun.com/goproxy,https://goproxy.cn,direct"
export PATH=$HOME/.local/bin:$PATH

export PATH=$PATH:/Library/Developer/CommandLineTools/usr/bin:$GOPATH/bin

# export CMAKE_C_COMPILER="/usr/local/bin/gcc-10"
# export CMAKE_CXX_COMPILER="/usr/local/bin/g++-10"

# alias
alias jumpstat="autojump -s"
alias diff='diff -u'
alias ls='ls -Gh'
alias df='df -h'
alias du='du -h'
alias vi='vim'
alias tree='tree -C'
alias rm='rm -i'
alias srm='srm -i'
alias mv='mv -i'
alias k='kubectl'
alias nproc="sysctl -n hw.logicalcpu"

alias gitconf_atttx123='git config user.name atttx123 && git config user.email atttx123@gmail.com'
alias gitconf_zhangyu01='git config user.name zhangyu01 && git config user.email zhangyu01@4paradigm.com'

alias f='export {HTTP,HTTPS,FTP,ALL}_PROXY="http://127.0.0.1:9999"'
function F() {
    IP=$(ifconfig en0 | grep "inet " | cut -d\  -f2)
    echo "export {HTTP,HTTPS,FTP,ALL}_PROXY=\"http://$IP:9999\""
    echo "export NO_PROXY=\"localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24\""
    echo "echo \"use_proxy=yes\nhttp_proxy=$IP:9999\nhttps_proxy=$IP:9999\" > ~/.wgetrc"
}
alias ff='unset {HTTP,HTTPS,FTP,ALL}_PROXY'
export NO_PROXY="localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24"

# use tsginghua mirror for homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_NO_AUTO_UPDATE=1

function pyenv() {
    if [ -z "$PYENV_ROOT" ]; then
        # use taobao mirror for pyenv
        export PYTHON_BUILD_MIRROR_URL="https://npm.taobao.org/mirrors/python/"
        export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=true

        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"
    fi
    command pyenv "$@"
}

function docker() {
    if ! type __docker_arguments >/dev/null 2>&1; then
        source $ZSH/plugins/docker/_docker
    fi
    command docker "$@"
}

function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi
    command kubectl "$@"
}

function lscpu() {
    echo "Architecture:\t\t$(uname -m)"
    echo "Byte Order:\t\t$(sysctl -n hw.byteorder)"
    echo "Active CPU(s):\t\t$(sysctl -n hw.logicalcpu)"
    echo "Thread(s) per core:\t$(( $(sysctl -n hw.logicalcpu) / $(sysctl -n hw.physicalcpu) ))"
    echo "Core(s) per socket:\t$(( $(sysctl -n hw.physicalcpu) / $(sysctl -n hw.packages) ))"
    echo "Socket(s):\t\t$(sysctl -n hw.packages)"
    echo "Vendor ID:\t\t$(sysctl -n machdep.cpu.vendor)"
    echo "CPU family:\t\t$(sysctl -n machdep.cpu.family)"
    echo "Model:\t\t\t$(sysctl -n machdep.cpu.model)"
    echo "Model Name:\t\t$(sysctl -n machdep.cpu.brand_string)"
    echo "Stepping:\t\t$(sysctl -n machdep.cpu.stepping)"
    echo "L1d cache:\t\t$(sysctl -n hw.l1dcachesize)"
    echo "L1i cache:\t\t$(sysctl -n hw.l1icachesize)"
    echo "L2 cache:\t\t$(sysctl -n hw.l2cachesize)"
    echo "L3 cache:\t\t$(sysctl -n hw.l3cachesize)"
    echo "Flags:\t\t\t$(sysctl machdep.cpu | grep features | awk -F": " '{print $2}' | tr '\n' ' ')"
}

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
# bindkey '^t' autosuggest-toggle
# bindkey '^f' autosuggest-accept


# zprof
# zmodload -u zsh/zprof
