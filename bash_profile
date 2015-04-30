# OnePortal
#export JAVA_HOME=$(/usr/libexec/java_home)
#export WEBDEV_FRONTEND_DIR=/Users/work/Documents/Optus/dev/OnePortal-FrontEnd
#export WEBDEV_ENV_DIR=/Users/work/Documents/Optus/dev/OnePortal-Tools

# OnePortal Alias
#alias 1p="cd ~/Documents/Development/Optus/OnePortal-FrontEnd"
#alias tomcat=${WEBDEV_ENV_DIR}/local_env/tomcat/bin/startup.sh

# UPC FrontEnd Alias
#alias upc="cd ~/Documents/Development/Optus/UPC-FrontEnd"

# MySQL
export PATH=~/bin:$(brew --prefix josegonzalez/php/php55)/bin:/usr/local/etc/php/5.5:/usr/local/bin:/usr/local/mysql/bin:$PATH

# Sonar
#export PATH=~/Documents/sonarqube-4.3/bin:~/Documents/sonar-runner-2.4/bin:$PATH
#export SONAR_QUBE_HOME=~/Documents/sonarqube-4.3
#export SONAR_RUNNER_HOME=~/Documents/sonar-runner-2.4

### Aliases

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias wn="cd ~/Documents/Development/Bauer/womens-network"
alias food="cd ~/Documents/Development/Bauer/womens-network/Bauer.Food.Web"
alias cukefood="cd ~/Documents/Development/Bauer/womens-network/automation/food-book"
alias mm="cd ~/Documents/Development/Bauer/money-site"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gco='git checkout'
alias gp='git push'
alias gf='git fetch && git fetch --tags'
alias gt='git tag -l'
alias gtl='git for-each-ref --format="%(taggerdate): %(refname)" --sort=-taggerdate --count=10 refs/tags'
alias gulpt='gulp test'
alias gulpmac='gulp --mac'
alias gm='git merge --no-ff'
alias gr='git pull --rebase'
alias gri='git pull --rebase -i'

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	BLACK="\033[01;30m"
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/dotfiles/z.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
