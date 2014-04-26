# terminal settings

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# git completion
if [ ! -f ~/git-completion.bash ]; then
    curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash
fi
source ~/git-completion.bash

# powerline
#. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# for tmux color
export TERM="xterm-256color"

# ---------------------------------------------------------------------------
# alias heavily inspired from http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
# ---------------------------------------------------------------------------

# customize for byronz
alias gedit='sudo gedit&'
alias chrome='chromium-browser&'
alias ff='firefox&'
alias av='. ~/automation/bin/activate'
alias reloadb='source ~/.bashrc'


# alias nb='ipython notebook --pylab inline'
# alias pq='ipython qtconsole --pylab'

# super user privileges
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    # alias poweroff='sudo /sbin/poweroff'
    # alias halt='sudo /sbin/halt'
    alias shutdown='sudo /sbin/shutdown'
    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias po='sudo shutdown -h now'
    alias poweroff='po'
    alias apt-get='sudo apt-get'
    alias root='sudo -i'
    alias su='sudo -i'
fi


# are you a person with a lot of typo?
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias lll='ll'

# if you are a person needs more security with your files, uncomment them
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -pv'

# cd is elegant
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


alias c='clear'
alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'
alias du='du -kh'
alias df='df -kTh'
alias bc='bc -l'

# The 'ls' family (this assumes you use the GNU ls)
alias ll='ls -la'
alias l.='ls -d .* --color=auto' # only show hidden files
alias la='ls -Al'               # show hidden files
alias ls='ls --color=auto'       # add colors for filetype recognition
alias lm='ll | less'            # pipe through less
alias tree='tree -Csu'          # nice alternative to 'ls'
# alias lx='ls -lXB'              # sort by extension
# alias lk='ls -lSr'              # sort by size
# alias lc='ls -lcr'              # sort by change time
# alias lu='ls -lur'              # sort by access time
# alias lr='ls -lR'               # recursive ls
# alias lt='ls -ltr'              # sort by date

# find has many ways
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ag='ag -ABS'


# less is more
alias more='less'

# http
alias header='curl -I'
alias headerc='curl -I --compress'
alias wget='wget -c'
alias ssh='ssh -X'


# utilities
alias diff='colordiff'
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5'    # Put a picture in the background
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined


# git abbreviations
alias gs='git status '
alias ga='git add '
alias gaa='git add --all'
alias gb='git branch '
alias gc='git commit'
alias gcm='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

export $(dbus-launch)
export NSS_USE_SHARED_DB=ENABLED
