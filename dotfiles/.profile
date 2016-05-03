export GOPATH=$HOME/go

PATH=~/bin:/usr/local/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH

source ~/.aliases

# for nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export CLICOLOR=1
export NODE_ENV='development'
export LANG=en_US.UTF-8
export EDITOR=vim
#export JAVA_HOME=$(/usr/libexec/java_home)
#export PATH=$JAVA_HOME/bin:$PATH
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

#eval "$(rbenv init -)"
