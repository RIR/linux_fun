# Week 1 study diary


I have very little experience on BASH scripting and although i've been using terminal, it has been mainly to access files or testing results in programming exercises etc. So here we go.

## Exercises:

1. I read the the refresher. Most of the commands are already familiar, but there were some new or forgotten things. e.g. Incremental history searching, which i'll start using from now on. I copied the nice script on turning text upside down too.

2.	I skimmed some man pages and played around with it. Man is somewhat familiar to me already.

3. Command to create directories:

        $ mkdir -p  LinuxFundamentals2015/Week1

4.	Alias fo your favorite command line for ls:
	
        $ alias la='ls -A'
        $ alias o='ls -latr'

    Alias cman that uses Chromium to read man pages:
	
	    $ alias cman='man –html=chromium-browser'


5.	My home folder don't have a bash_profile-file and i thought it's unnecessary to make one just for this case, because it would be an empty file. Instead i show .bashrc and bash_aliases contents here and copy those 	to this weeks home folder.

*   .bashrc		


* ```
    # ~/.bashrc: executed by bash(1) for non-login shells.
    # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
    # for examples

    # If not running interactively, don't do anything
    case $- in
    *i*) ;;
      *) return;;
    esac

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

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    #force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
  fi

  if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  fi
  unset color_prompt force_color_prompt

  # If this is an xterm set the title to user@host:dir
  case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;

  esac

  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval 
    "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi

    # some more ls aliases
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
  alias o='ls -latr'

  # Add an "alert" alias for long running commands.  Use like so:
  #   sleep 10; alert
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

  # Alias definitions.
  # You may want to put all your additions into a separate file like
  # ~/.bash_aliases, instead of adding them here directly.
  # See /usr/share/doc/bash-doc/examples in the bash-doc package.

  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  # enable programmable completion features (you don't need to enable
  # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
  # sources /etc/bash.bashrc).
  if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
   fi
  fi
 
  export PATH=$PATH:~/bin

  # ToDOta varten!
  PATH=$PATH:"/home/fuksi/todo.txt_cli-2.10/todo.sh"
  export TODOTXT_DEFAULT_ACTION=ls
*   bash_aliases

    ```
    # ToDO-list alias
    alias t='./todo.sh -d /home/fuksi/todo.txt_cli-2.10/'

    # man-sivut selaimella firefox-käytössä, koska chrome ei anna sivuja.
    alias cman='man –html=firefox'
    ```

6. I used example found on linux.fi where i add profile for a connection to ~/.ssh/config file. Host will define aliases that use each profile.

    E.g.
    ```
	Host lyhytnimi minun.palvelin.example 
   	HostName minun.palvelin.example
 	User kayttajatunnus
    ```

    Because i couldn't connect to ukko from university's laptop, i ended up         making a profile for connecting shell.cs.helsinki.fi. From there i did the same thing to connect to ukko. After that i realised i can connect straight from laptop using following lines added to ~/.ssh/config file.

    ```
    Host laitos shell.cs.helsinki.fi
	HostName shell.cs.helsinki.fi
	User rairanta

	Host ukko ukko161.hpc.cs.helsinki.fi
	HostName ukko161.hpc.cs.helsinki.fi
	user rairanta
	ProxyCommand ssh -q laitos nc -q0 ukko161.hpc.cs.helsinki.fi 22 
    ```
    And then connecting from terminal using:

    ```
    $ ssh ukko
    ```
    Invoking ls -a (ls did not show anything) from ukko, i used aliases from        previous task.
    ```
	$ ssh ukko ls -a
    ```
    Output was a bit different from my own host, because i use color codes etc. 
    
    The sequence of commands that need to be entered to get a password-prompt-less login to Ukko

    ```
	$ ssh-keygen -t rsa 
	```
	at ukko node,
	```
	$ ssh-keygen -t rsa
	```
	in local host
    ```
	$ scp ~/.ssh/id_rsa.pub rairanta@ukko161.hpc.cs.helsinki.fi
	```
    from local host.
    ```
	$ ssh ukko 
	```
    from local host.

    Again, i had to export public key from both, my laptop and my shell.cs.helsinki.fi account. This way, ssh works straight from my laptop to ukko. I appended public key from laptop to ukko's authorized_keys using
    ```
	$ cat id_rsa.pub >> .ssh/authorized_keys
    ```
    and now login works as wanted.
    
7.  I moved all the aliases to bash_aliases. Given snippet is already used in mys .bashrc as seen above on task 5.

    Calling ssh to ukko after removing snippet from shell.cs.helsinki.fi host (because my connection to ukko goes via that):
    
    ```
    fuksi@dhcp-asv-103:~$ ssh ukko ls
    id_rsa.pub
     ```
    Doing same after putting back the snippet: 
    
    ```
    fuksi@dhcp-asv-103:~$ ssh ukko ls
    /home/rairanta/.bash_aliases: line 1: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    /home/rairanta/.bash_aliases: line 2: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    id_rsa.pub
    ```
8. Creating and copying a file to ukko node, signing in and printing the copied file all in one chained command using safe copy:

    ```
    fuksi@dhcp-asv-103:~$ hostname > ~/LinuxFundamentals2015/Week1/hostname.txt; scp ~/LinuxFundamentals2015/Week1/hostname.txt rairanta@ukko161.hpc.cs.helsinki.fi:/cs/work/home/rairanta/; ssh ukko cat /cs/work/home/rairanta/hostname.txt; 
    
    /home/rairanta/.bash_aliases: line 1: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    /home/rairanta/.bash_aliases: line 2: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    hostname.txt                                                                    100%   13     0.0KB/s   00:00    
    /home/rairanta/.bash_aliases: line 1: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    /home/rairanta/.bash_aliases: line 2: alias: --: invalid option
    alias: usage: alias [-p] [name[=value] ... ]
    dhcp-asv-103
    ```
    From melkinpaasi using just cp the same thing works like this:
    
    ```
    rairanta@melkinpaasi:~$ hostname > LinuxFundamentals2016/Week1/hostname.txt; cp LinuxFundamentals2016/Week1/hostname.txt /cs/work/home/rairanta/hostname.txt; ssh ukko cat /cs/work/home/rairanta/hostname.txt; 
    Enter passphrase for key '/home/rairanta/.ssh/id_rsa': 
    melkinpaasi
    ```
9. RSYNC. Terminal action with non-existing subdir and then with populated one:
      ```
      rairanta@melkinpaasi:~/LinuxFundamentals2016/Week1$ rsync -v --archive /cs/home/tkt_cam/public_html/2015/09/30/ ~/LinuxFundamentals2016/Week1/Wednesday.2015.09.30 sending incremental file list created directory /home/rairanta/LinuxFundamentals2016/Week1/Wednesday.2015.09.0
    ./201509300000.jpg
    201509300100.jpg
    201509300200.jpg
    201509300300.jpg
    201509300400.jpg
    201509300500.jpg
    201509300600.jpg
    201509300700.jpg
    201509300800.jpg
    201509300900.jpg
    201509301000.jpg
    201509301100.jpg
    201509301200.jpg
    201509301300.jpg
    201509301400.jpg
    201509301500.jpg
    201509301600.jpg
    201509301700.jpg
    201509301800.jpg
    201509301900.jpg
    201509302000.jpg
    201509302100.jpg
    201509302200.jpg
    201509302300.jpg

    sent 9,890,062 bytes  received 561 bytes  3,956,249.20 bytes/sec
    total size is 9,886,229  speedup is 1.00
      ```
      
      ```
       rairanta@melkinpaasi:~$ rsync -v --archive/cs/home/tkt_cam/public_html/2015/09/30/~/LinuxFundamentals2016/Week1/Wednesday.2015.09.30
    sending incremental file list

    sent 554 bytes  received 88 bytes  1,284.00 bytes/sec
    total size is 9,886,229  speedup is 15,399.11
      ```
10. Time and date. Command and result for date as requested:

	```
	fuksi@dhcp-asv-103:~$ date +%A.%Y.%m.%d
	Wednesday.2016.11.02
	```
	And the script code
	
	```
	#!/bin/bash

    echo "rsync --archive /cs/home/tkt_cam/public_html/`date +%Y/%m/%d/` ~/LinuxFundamentals2016/Week1/`date +%A.%Y.%m.%d`"
	```
	ShellCheck recommends using ```$(..)``` instead of ``` `..` ``` and in that case the script code is: 
	
	```
	#!/bin/bash

    echo "rsync --archive /cs/home/tkt_cam/public_html/$(date +%Y/%m/%d/) ~/LinuxFundamentals2016/Week1/$(date +%A.%Y.%m.%d)"
	```
	
	



	



























