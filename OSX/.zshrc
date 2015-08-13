# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/go/bin:/Users/jonathan/.svm/shims:/Applications/VMware\ Fusion.app/Contents/Library;"
# export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ducknorris"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

POWERLINE_DETECT_SSH="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"
POWERLINE_HIDE_HOST_NAME="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git web-search docker)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias gcma='git commit -am'
alias gcl='git clean -fd'
alias work='cd /Users/jonathan/Projects/vq'
alias vqconsole='mono /Users/jonathan/Projects/vq/VQCore/VQConsole/bin/Debug/VQConsole.exe'
alias vqweb='mono /Users/jonathan/Projects/vq/VQCore/VQPortal.Hosting.Self/bin/Debug/VQPortal.Hosting.Self.exe'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias xunit='mono /usr/bin/xunit.runner.console.2.0.0/xunit.console.exe'
#alias xunit='mono ~/Projects/Nancy/tools/xunit/xunit.console.clr4.x86.exe'
alias omnisharp='cd /Users/jonathan/Library/Application\ Support/Sublime\ Text\ 3/Packages/OmniSharp'
alias gacm='git add -A && git commit -am'


bindkey -e;
bindkey '\e\e[C' forward-word;
bindkey '\e\e[D' backward-word;

function precmd() {
  if command git rev-parse --git-dir > /dev/null 2>&1; then
    window_label=$(git rev-parse --show-toplevel)
    tab_label=$(echo $window_label | awk -F\/ '{print "[git] " $NF}')
  else
    window_label=${PWD/${HOME}/\~}
    tab_label=$window_label
  fi
  echo -ne "\e]2;${window_label}\a"
  echo -ne "\e]1;${tab_label: -24}\a"
}


source dnvm.sh # dot net shizzle

# scriptcs version manager
. $HOME/.svm_profile

# stop shared terminal history. USE setopt to reenable
unsetopt inc_append_history
unsetopt share_history

# docker
export DOCKER_HOST=tcp://docker.local:2376
# export DOCKER_CERT_PATH=/Users/jonathan/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

PERL_MB_OPT="--install_base \"/Users/jonathan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jonathan/perl5"; export PERL_MM_OPT;
