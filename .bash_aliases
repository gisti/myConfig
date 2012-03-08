#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # Changed the color option from 'auto' to 'always' (in: ls, grep, fgrep, egrep)
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias agrep='grep -nR --color=always --exclude=cscope.out --exclude=tags'
    alias antgrep="agrep --exclude-dir='./ut' --exclude-dir='./reut' --exclude-dir='./.git'"
    alias  grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
    alias less='less -Rs'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias aptitude='sudo aptitude'
alias apt-get='sudo apt-get'

# My aliases
alias gdiff='git diff; git submodule foreach --quiet git diff'
alias ssh_host='f() { val=$(cat ~/.xhost); echo "Connecting to "$val; ssh $val; }; f'
alias ssh_system='f() { val=$(cat ~/.xsystem); echo "Connecting to "$val; ssh $val; }; f'
#alias seecode='getList() { agrep unequippedModules . | termenu -m -o | awk -F '\'':'\'' '\''{print "vim +"$2,$1}'\''; }; getList $@'
#alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\'':'\'' '\''{print "vim +"$2,$1}'\''; }; getList $@'
#alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\'':'\'' '\''BEGIN {print "\" \\"} {print "gvim --remote-silent +"$2,$1"; \\"} END {print "\""}'\''; }; getList $@'
#alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\'':'\'' '\''{print "/usr/bin/gvim --remote-silent +"$2,$1";\\ "}'\''; }; getList $@'
###alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\''[\n|:]'\'' '\''{printf "/usr/bin/gvim --remote-silent +%s %s; ",$2,$1}'\''; }; getList $@'
alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\''[\n|:]'\'' '\''BEGIN {printf "eval %s","\""}{printf "/usr/bin/gvim --remote-silent +%s %s; ",$2,$1} END {printf "%s","\""}'\''; }; getList $@'
#alias seecode='getList() { agrep $@ | termenu -m -o | awk -F '\'':'\'' '\''{print "gvim --remote-silent +"$2,$1}'\''; }; \
#               openFiles() { echo $(getList $@); }; openFiles $@'
alias gcheckout='fullcheckout () { git checkout $(git branch -l | sed "s/^*//" | termenu) && git submodule update --init --recursive; }; fullcheckout $@'
alias ee='gvim -S ~/.vim.sess --remote-silent'
alias e='ff () { gvim -S ~/.vim.sess --remote-silent `find . -name $@ | termenu -o 2> /dev/null` 2> /dev/null; }; ff $@'
alias settitle='ff () { PROMPT_COMMAND="echo -ne \"\033]0;$@\007\""; }; ff $@'
alias gsu='git submodule --quiet update --init --recursive'
alias gg='git grep -n --color=always'
alias wd='cd ~/source/qa/tlib/'
alias invd='cd ~/source/qa/investigate/'
alias killnotes='/opt/ibm/lotus/notes/nsdcollector.sh -kill'
alias screenls='sudo ls -laR /var/run/screen'
alias screenproc='ps auxw | grep -i screen | grep -v grep'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


