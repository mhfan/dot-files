# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

FILE=/usr/share/doc/bash/examples/startup-files/bashrc
[ -r $FILE ] && source $FILE

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

FILE=~mhfan/.bash_aliases; [ -r $FILE ] && . $FILE

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    FILE=~mhfan/.dir_colors; [ -r $FILE ] && \
    eval "$(dircolors -b $FILE)" || eval "$(dircolors -b)"
    
    #alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

function load_prompt() {

# Prompt escapes:
#  \a         an ASCII bell character (07)
#  \d         the date in "Weekday Month Date" format (e.g., "Tue May 26")
#  \D{format} the format is passed to strftime(3) and the result
#             is inserted into the prompt string an empty format
#             results in a locale-specific time representation.
#             The braces are required
#  \e         an ASCII escape character (033)
#  \h         the hostname up to the first `.'
#  \H         the hostname
#  \j         the number of jobs currently managed by the shell
#  \l         the basename of the shell's terminal device name
#  \n         newline
#  \r         carriage return
#  \s         the name of the shell, the basename of $0 (the portion following
#             the final slash)
#  \t         the current time in 24-hour HH:MM:SS format
#  \T         the current time in 12-hour HH:MM:SS format
#  \@         the current time in 12-hour am/pm format
#  \A         the current time in 24-hour HH:MM format
#  \u         the username of the current user
#  \v         the version of bash (e.g., 2.00)
#  \V         the release of bash, version + patch level (e.g., 2.00.0)
#  \w         the current working directory, with $HOME abbreviated with a tilde
#  \W         the basename of the current working directory, with $HOME
#             abbreviated with a tilde
#  \!         the history number of this command
#  \#         the command number of this command
#  \$         if the effective UID is 0, a #, otherwise a $
#  \nnn       the character corresponding to the octal number nnn
#  \\         a backslash
#  \[         begin a sequence of non-printing characters, which could be used
#             to embed a terminal control sequence into the prompt
#  \]         end a sequence of non-printing characters

# Prompt cursor:
    CURPOS='\e[$ROW;${COL}f'
    CURSAV='\e[[s'
    CURRES='\e[[u'

# Prompt colors:
    TXTBLK='\e[0;30m' # Black - Regular
    TXTRED='\e[0;31m' # Red
    TXTGRN='\e[0;32m' # Green
    TXTYLW='\e[0;33m' # Yellow
    TXTBLU='\e[0;34m' # Blue
    TXTPUR='\e[0;35m' # Purple
    TXTCYN='\e[0;36m' # Cyan
    TXTWHT='\e[0;37m' # White
    BLDBLK='\e[1;30m' # Black - Bold
    BLDRED='\e[1;31m' # Red
    BLDGRN='\e[1;32m' # Green
    BLDYLW='\e[1;33m' # Yellow
    BLDBLU='\e[1;34m' # Blue
    BLDPUR='\e[1;35m' # Purple
    BLDCYN='\e[1;36m' # Cyan
    BLDWHT='\e[1;37m' # White
    UNKBLK='\e[4;30m' # Black - Underline
    UNDRED='\e[4;31m' # Red
    UNDGRN='\e[4;32m' # Green
    UNDYLW='\e[4;33m' # Yellow
    UNDBLU='\e[4;34m' # Blue
    UNDPUR='\e[4;35m' # Purple
    UNDCYN='\e[4;36m' # Cyan
    UNDWHT='\e[4;37m' # White
    BAKBLK='\e[40m'   # Black - Background
    BAKRED='\e[41m'   # Red
    BADGRN='\e[42m'   # Green
    BAKYLW='\e[43m'   # Yellow
    BAKBLU='\e[44m'   # Blue
    BAKPUR='\e[45m'   # Purple
    BAKCYN='\e[46m'   # Cyan
    BAKWHT='\e[47m'   # White
    TXTRST='\e[0m'    # Text Reset

    PS1=""
    PROMPT_COMMAND='RET=$?;'
    JOB_NUM='$([ \j != 0 ] && echo -n " \j")'
    RET_VAL='$([ $RET != 0 ] && echo -n -$RET)'

  if [ "`id -u`" = 0 ]; then
    PS1="$PS1\[$TXTRED\][${SSH_CLIENT:+\[${BLDCYN}\]SSH }"
    PS1="$PS1\[$BLDYLW\]\u\[$TXTRST\]@\[$BLDPUR\]\h\[$TXTRST\]: "
    PS1="$PS1\[$UNDYLW\]\w\[$TXTGRN\]$JOB_NUM\[$TXTRED\]>-\[$TXTCYN\]\!"
    PS1="$PS1\[$BLDRED\]$RET_VAL\[$TXTRED\]#\[$TXTRST\] "
  else
    PS1="$PS1\[$TXTGRN\][${SSH_CLIENT:+\[${BLDPUR}\]SSH }"
    PS1="$PS1\[$TXTYLW\]\u\[$TXTRST\]@\[$BLDCYN\]\h\[$TXTRST\]: "
    PS1="$PS1\[$UNDWHT\]\w\[$TXTRED\]$JOB_NUM\[$TXTGRN\]>-\[$TXTCYN\]\!"
    PS1="$PS1\[$BLDRED\]$RET_VAL\[$TXTGRN\]\$\[$TXTRST\] "
  fi

    export PS1 PROMPT_COMMAND
}

load_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#FILE=/etc/bash_completion; [ -r $FILE  ] && ! shopt -oq posix && . $FILE

pathadd () {
    if echo $PATH | /bin/egrep -q "(^|:)$1($|:)"; then return; fi
    if [ "$2" = "last" ]; then PATH=$PATH:$1; else PATH=$1:$PATH; fi
}

function sl2file() {
    for s in $@; do
	if [ -h $s ]; then
	    ls -l $s; f=`readlink $s`
	    rm -f $s; cp -f $f $s
	fi
    done
}

function tzx() {
    for fn in $@; do
	local prog
	case $fn in
	    *.bz2|*.tbz2|*.bz)	prog="bzcat";;
	    *.gz|*.Z|*.tgz)	prog="zcat";;
	    *)			prog="cat";;
	esac
	echo "Unpacking $fn ... ..."
	$prog $fn | tar -xf - &
    done
}

function tzl() {
    local prog
    case $1 in
	*.bz2|*.tbz2|*.bz)  prog="bzcat";;
	*.gz|*.Z|*.tgz)	    prog="zcat";;
	*)		    prog="cat";;
    esac
    $prog $1 | tar -tf -
}

function tgz() { tar -czf `basename $1`.tgz $@ & }
function tbz() {
    local fn=`basename $1`.tar
    tar -cf $fn  $@ && bzip2 $fn &
}

function backup() {
    for fn in $@; do /bin/cp -r $fn $fn-bak; done
}

function unlink() {
    for fn in $@; do /bin/unlink $fn; done
}

function cdls() { cd $@ && ls; }

function iproj()
{
    #T=$(gettop)
    if [ $# -lt 1 ]; then
        echo "Usage: iproj <[/]path/to/git-repo> [<dir-name>]"; return
    fi

    local PROJ PGIT;
    if [ -n "$2" ] && [ ${2} != "/" ] && [ ${2%/} != "." ]; then
	PROJ=$2; else PROJ=$(basename $1)
    fi; PROJ=${PROJ%.git}
    [ -e $PROJ/.git ] && return 2

    if [ $(basename $PWD) != $PROJ ]; then
	mkdir -p $PROJ/.git; cd $PROJ; else mkdir .git; fi

    PGIT=${1%/}
    if echo $PGIT | grep -q "^/"; then REL=; else REL=../; fi

    PGIT=${REL}$PGIT
    [ -e $PGIT/.git ] && PGIT=$PGIT/.git
    cp $PGIT/HEAD .git/ || return 1
    PGIT=${REL}$PGIT

    for l in config description hooks info logs objects packed-refs \
	    refs rr-cache svn branches; do
        ln -s $PGIT/$l .git/; done
    #symlinks -cs .git

    git read-tree --reset -u -v HEAD; ls
}


#QMAKESPEC=/home/mhfan/devel/am335x/tisdk/linux-devkit/arm-arago-linux-gnueabi/usr/share/qtopia/mkspecs/linux-g++;export QMAKESPEC; # ADDED BY INSTALLER - DO NOT EDIT OR DELETE THIS COMMENT - AB1C36D0-2B62-930A-B1CF-1B15CF69BE47 50959CCA-03C0-4BCD-5E85-3B3697E9139A
