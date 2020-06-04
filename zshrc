#  Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zmodload zsh/zprof


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my_sunrise"

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
plugins=(autojump git)


source $ZSH/oh-my-zsh.sh

# User configuration
export JAVA_HOME=$(/usr/libexec/java_home)
export GOPATH="/Users/yu/Workspace/gopath"
export PATH=/usr/local/opt/grep/libexec/gnubin:$HOME/.local/bin:/usr/local/bin:$PATH

# export ANDROID_SDK=/Users/yu/Android/sdk
# export ANDROID_NDK=$ANDROID_SDK/ndk-bundle
# export ANDROID_HOME=/Users/yu/Android/sdk
# export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
# export PATH=$PATH:$GOPATH/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$GOPATH/bin:/Library/Developer/CommandLineTools/usr/bin
export EDITOR="/Applications/MacVim.app/Contents/bin/vim"

# alias
alias jumpstat="autojump -s"
alias diff='diff -u'
alias ls='ls -Gh'
alias df='df -h'
alias du='du -h'
alias vi='vim'
alias vik8s='vim "+call K8S()" "+VikubeContextList"'
alias vimk8s='vik8s'
alias tree='tree -C'
alias rm='rm -i'
alias srm='srm -i'
alias mv='mv -i'
alias k='kubectl'

alias urldecode='python -c "import sys, urllib as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python -c "import sys, urllib as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urlsafe_base64encode='python -c "import base64, sys; print(base64.urlsafe_b64encode(open(sys.argv[1], /"rb/").read()))"'

alias gitconf_atttx123='git config user.name atttx123 && git config user.email atttx123@gmail.com'
alias gitconf_zhangyu01='git config user.name zhangyu01 && git config user.email zhangyu01@4paradigm.com'

alias f='export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:9999"'
alias ff='unset {HTTP,HTTPS,FTP}_PROXY'
export NO_PROXY="localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24"

# use tsginghua mirror for homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

function pyenv-init() {
    source $ZSH/plugins/pyenv/*.zsh
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    source <(command pyenv completions zsh)
}

function jenv-init() {
    source $ZSH/plugins/jenv/*.zsh
    export JENV_ROOT="${HOME}/.jenv"
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init -)"
    source $JENV_ROOT/completions/*.zsh
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


# zprof
# zmodload -u zsh/zprof
