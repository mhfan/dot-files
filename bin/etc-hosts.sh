#!/bin/bash
 ################################################################
 # $ID: etc-hosts.sh   一, 18  9 2017 17:44:50 +0800  mhfan $ #
 #                                                              #
 # Description:                                                 #
 #                                                              #
 # Maintainer:  范美辉 (MeiHui FAN) <mhfan@ustc.edu>            #
 #                                                              #
 # Copyright (c) 2017 M.H.Fan                                   #
 #   All Rights Reserved.                                       #
 #                                                              #
 # This file is free software;                                  #
 #   you are free to modify and/or redistribute it  	        #
 #   under the terms of the GNU General Public Licence (GPL).   #
 #                                                              #
 # Last modified: 一, 18  9 2017 17:53:57 +0800       by mhfan #
 ################################################################

# https://github.com/sy618/hosts
# https://github.com/googlehosts/hosts
# https://github.com/wangchunming/2017hosts
# https://github.com/lennylxx/ipv6-hosts
# https://github.com/racaljk/hosts
# https://github.com/vokins/yhosts

URL=https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
URL=https://raw.githubusercontent.com/sy618/hosts/master/FQ

# /tmp/hosts && mv /tmp/hosts
curl $URL -o /etc/hosts

 # vim:sts=4:ts=8:
