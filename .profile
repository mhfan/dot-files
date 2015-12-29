# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    FILE=~mhfan/.bashrc; [ -r $FILE ] && . $FILE
fi

#xhost + >& /dev/null
xhost +local:mhfan >& /dev/null
#xhost +inet:192.168.2.240 >& /dev/null

#xrdb -merge ~/.Xdefaults

export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin

# set PATH so it includes user's private bin if it exists
FILE=~/bin; [ -d $FILE ] && PATH=$FILE:$PATH

#FILE=~mhfan/.l10n; [ -r $FILE ] && . $FILE

export CONFIG_SITE="~mhfan/.config.site"
export RLWRAP_HOME="~mhfan/.rlwrap/"
export GL_BYPASS_UPDATE_HOOK=1

pathadd /opt/android-ndk
#pathadd /opt/arm-sourcery/bin
pathadd /opt/android-sdk-linux/tools
pathadd /opt/android-sdk-linux/platform-tools
#pathadd ~mhfan/devel/mhdroid/out/host/linux-x86/bin
#pathadd ~mhfan/devel/mhdroid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin
export NDK_CCACHE=ccache USE_CCACHE=1 CCACHE_COMPRESS=1 #CCACHE_PREFIX=distcc

[ "`id -u`" = 0 ] && pathadd /etc/init.d last

export RUBYLIB=$(for P in $(/usr/bin/ruby -e 'puts $:'); do echo -n $P:; done)

#QMAKESPEC=/home/mhfan/devel/am335x/tisdk/linux-devkit/arm-arago-linux-gnueabi/usr/share/qtopia/mkspecs/linux-g++;export QMAKESPEC; # ADDED BY INSTALLER - DO NOT EDIT OR DELETE THIS COMMENT - AB1C36D0-2B62-930A-B1CF-1B15CF69BE47 50959CCA-03C0-4BCD-5E85-3B3697E9139A
