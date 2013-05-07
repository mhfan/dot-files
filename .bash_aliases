#!/bin/bash
 ################################################################
 # $ID: .bash_aliases  Wed, 30 Jul 2008 16:53:50 +0800  mhfan $ #
 #                                                              #
 # Description:                                                 #
 #                                                              #
 # Maintainer:  ∑∂√¿ª‘(MeiHui FAN)  <mhfan@ustc.edu>            #
 #                                                              #
 # CopyLeft (c)  2008  M.H.Fan                                  #
 #   All rights reserved.                                       #
 #                                                              #
 # This file is free software;                                  #
 #   you are free to modify and/or redistribute it  	        #
 #   under the terms of the GNU General Public Licence (GPL).   #
 ################################################################

FILE=/usr/share/doc/bash/examples/startup-files/Bash_aliases
[ -r $FILE ] && source $FILE

#echo "obase=16; ibase=16; for (i = 6DA2; i < 7CFF; ) ++i;" | bc | \
#   while read i; do echo 2001:f10:5001:$i::2; done > /tmp/ipv6.hhsvr; \
#   nmap -iL /tmp/ipv6.hhsvr -p 22 -6

alias dh_make='DEBFULLNAME="MeiHui FAN" dh_make -s -n'

alias ttyS0="kermit -l /dev/ttyS0 -b 115200 -C connect"
alias ttyACM0="kermit -l /dev/ttyACM0 -b 115200 -C connect"
alias ttyUSB0="kermit -l /dev/ttyUSB0 -b 115200 -C connect"
alias ttyUSB1="kermit -l /dev/ttyUSB1 -b 115200 -C connect"
alias ttyUSB2="kermit -l /dev/ttyUSB2 -b 4800   -C connect"

if [ $(id -u) -gt 0 ]; then
    alias svi='sudo vim'
    alias aptitude="sudo aptitude"
fi

alias rsync="rsync -ouavzHh --progress --stats"
alias diff="colordiff -uwbBENarp"

alias lynx='w3m'
alias less='less -R'
alias disp='display'
#alias tig='tig --stat --abbrev-commit --color-words --decorate'

alias wnb='LC_CTYPE=C wnb'
alias fbbs='LC_CTYPE=C fbbs'
alias bbsbot='LC_CTYPE=C bbsbot'
alias hugs="hugs -98 +o +H +. +w +s +T +Q +k -h1024k -E'vim %s' -c64"
        #' -P.:{Home}/haskell:{Hugs}/libraries:{Hugs}/oldlib'

alias cscope="cscope -Rbkq"
alias rlwrap='rlwrap -s 256 -c'
alias grep='grep -n --color=auto'
alias wvHtml='wvHtml --charset=gb2312'
alias ls='/bin/ls -bF --color=auto --show-control-chars'
alias lsdot='ls .[a-zA-Z0-9_]*'

alias s='cd ..'
alias p='cd -'
alias rm='rm -ri'
alias cd..='cd ..'
alias mv='/bin/mv -i'
alias del='/bin/rm -rf'
alias cp='/bin/cp -Lir'

alias g=git
alias df='df -h'
alias du='du -sh'
alias lns='ln -s'
alias ll='ls -lGSh'
alias scp='scp -Cpr'

#alias xplanet="xplanet -config config -num_times 1 -back background.jpg -fontsize 10 -longitude 108 -latitude 16 -transparency -starmap BSC -xscreensaver -date `date +%Y%m%d.%H%M%S --date='-8 hour'`"
# -searchdir $HOME/.xplanet

# vim:sts=4:ts=8: 
