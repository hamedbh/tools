#   This file holds my bash setup, aliases and configurations

#   Environment

#   Set PATH
    export PATH="/Users/hamedbh/.local/bin:/usr/local/git/bin:/usr/local/bin:/usr/local:$PATH:Users/hamedbh/bin"
    export PATH="/usr/local/sbin:$PATH"
#   Set Default Editor to Vim

    export EDITOR=/usr/local/bin/vim

#   Bindings
    
    bind '"\e[A":history-search-backward'
    bind '"\e[B":history-search-forward'
#   Aliases
    
    alias cp="cp -iv"           # cp is verbose and will require confirmation before overwriting files
    alias mv='mv -iv'           # mv is verbose and will require confirmation before overwriting files
    alias mkdir='mkdir -pv'     # mkdir uses verbose mode by default and creates intermediate directories
    alias ll="ls -aFGhlLp"      # gives list in long format with other options set as preferred 
    alias getmyip='dig +short myip.opendns.com @resolver1.opendns.com'
    alias pgs='brew services start postgresql'
    alias pgq='brew services stop postgresql'
    alias pgrestart='brew services restart postgresql'
    alias netwtf='sudo /usr/local/Cellar/mtr/0.87/sbin/mtr -n 8.8.8.8'
    alias editcron='env EDITOR=nano crontab -e'
    alias edbp='vim ~/.bash_profile'
    alias classupdate='hg pull -b default && hg update -t internal:local'
    alias DTMakevars='cp /Users/hamedbh/github/tools/data.table_Makevars/Makevars /Users/hamedbh/.R/Makevars' 
    alias stdMakevars='cp /Users/hamedbh/github/tools/main_Makevars/Makevars /Users/hamedbh/.R/Makevars'

    alias xgboostMakevars='cp /Users/hamedbh/github/tools/xgboost_Makevars/Makevars /Users/hamedbh/.R/Makevars'
    alias rjavaupdate='R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers'
# Turn on recursive globbing (only available in Bash V4)

#    shopt -s globstar

# Fix for Octave plotting issues
    export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig
    export HOMEBREW_GITHUB_API_TOKEN="00fbfc2e10105986fdfa5d3f2b57a572602b2722"

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

brewPkg() {
  pkg=$1
  shift
  (
    brew install ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}

brewSrcPkg() {
  pkg=$1
  shift
  (
    brew install --build-from-source  ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}

brewSrcPkgWgcc() {
  pkg=$1
  shift
  (
    export CC=gcc-7
    export CXX=g++-7
    export HOMEBREW_CC=gcc-7
    export HOMEBREW_CXX=g++-7
    brew install --build-from-source  ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}



# added by Anaconda3 4.4.0 installer
export PATH="/Users/hamedbh/anaconda3/bin:$PATH"
export R_LIBS_USER=/Users/hamedbh/Library/R/3.x/library
export GOPATH=/Users/hamedbh/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/bin
export HOMEBREW_GITHUB_API_TOKEN="853d0ef8076be1088a93a30fae651b90a03b622c"

# added by Anaconda3 4.4.0 installer
export PATH="/Users/hamedbh/anaconda3/bin:$PATH"


export R_LIBS_USER=/Users/hamedbh/Library/R/3.x/library
export R_LIBS_USER=/Users/hamedbh/Library/R/3.x/library
