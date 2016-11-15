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
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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

echo   "   _____ ____________     _____    __   "
echo   "  |__  // ____/ ____/    /  _/ |  / /   "
echo   "   /_ </ / __/ /         / / | | / /    "
echo   " ___/ / /_/ / /___     _/ /  | |/ /     "
echo   "/____/\____/\____/    /___/  |___/      "
echo   ""
echo   "            Welcome to 3GCIV            "

                                        
export PATH=/bin:/lib:/usr/bin:/usr/lib:/usr/local/bin:/usr/local/lib:${HOME}/.local/bin:${HOME}/.local/lib:/usr/local/cuda-7.5/bin:$PATH
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:${HOME}/.local/lib:/usr/local/cuda-7.5/lib:$LD_LIBRARY_PATH
export PYTHONPATH=${HOME}/.local/lib/python-2.7/site-packages:$PYTHONPATH

#setup aliases
TGCIV_SRC="/home/hugo/3GCIV/src"
DOCKER_OPTS="-it --rm --net=host -e QT_X11_NO_MITSHM=1 -e DISPLAY=${DISPLAY} --volume=\"${HOME}:${HOME}:rw\" --volume=\"/etc/group:/etc/group:ro\" --volume=\"/etc/passwd:/etc/passwd:ro\" --volume=\"/etc/shadow:/etc/shadow:ro\" --volume=\"/etc/sudoers.d:/etc/sudoers.d:ro\" --volume=\"/3gciv_data/${USER}:/scratch/${USER}\" --volume=\"/3GCIV_MASTER/VAULT:/vault:ro\" --user=`id -ur` --workdir=\"${HOME}\" -e HOME=\"${HOME}\" --shm-size=50g -e EDITOR=vim"
#source local AIPS
#source /opt/aips/LOGIN.SH
echo "AIPStv*useSharedMemory:   0" > ${HOME}/.Xdefaults
xrdb -merge ${HOME}/.Xdefaults

function astro_help {
	echo "The following commands are available:"
	echo -e "\tcasa --- runs NRAO casa"
	echo -e "\tmeqbrowser.py --- runs the Meqtree interface"
	echo -e "\tmeqtree-pipeliner.py --- runs the meqtree-pipeliner"
	echo -e "\tmiriad_umd --- runs the BIMA/UMD branch of Miriad (suite of tasks)"
	echo -e "\tmiriad_csiro --- runs CSIRO Miriad (suite of tasks)"
	echo -e "\ttigger --- runs tigger FITS viewer"
	echo -e "\tnotebook_runner --- starts up dockerized jupyter"
	echo -e "\tds9 --- starts up ds9 FITS viewer"
	echo -e "\tgipsy_aladin_tomcat --- starts up gipsy, aladin and tomcat"
	echo -e "\tgipsy_only --- starts up gipsy"
	echo -e "\tkarma --- starts up an environment with KARMA tasks"
	echo -e "\tkvis --- starts up kvis FITS viewer"
	echo -e "\tkpvslice --- starts KARMAs HI moments viewer"
	echo -e "\twsclean --- Andre's w-stacking imager"
	echo -e "\taoflagger_run --- Andre's RFI flagging and visualization tools (suite of tasks)"
	echo -e "\trunpurify --- Runs the BASP group's PURIFY, CS deconvolution tool"
	echo -e "\tgoaips --- NRAO AIPS"
	echo -e "\truntirific --- Runs environment with Tirific"
	echo -e "\tsofia --- Runs SOFIA HI Source Finding Pipeline (gui)"
	echo -e "\tsofia_pipeline --- Runs SOFIA HI Source Finding Pipeline (pipeline tool)"
	echo -e "\tfat --- Sets up environment with Fully Automated Tirific GDL scripting"
	echo -e "\tpybdsm --- Starts pybdsm command line (part of LOFARsoft)"
	echo -e "\trunsourcery --- Starts sourcery. Software for creating source catalogues."
	echo -e "\tDDF.py --- Runs DDFacet, facet based imaging software."
	echo -e "\tpymoresane --- Runs pymoresane deconvolution software"
	echo -e "\trunsimms --- software to create an empty measurement set given telescope name"
	echo -e "\tkaroogp --- genetic programming"
}
astro_help
#alias casa="docker run ${DOCKER_OPTS} casa_3gciv"
#alias casapy="docker run ${DOCKER_OPTS} casa_3gciv"
#alias meqbrowser.py="docker run ${DOCKER_OPTS} --entrypoint meqbrowser.py radioastro/meqtrees"
#alias meqtree-pipeliner.py="docker run ${DOCKER_OPTS} --entrypoint meqtree-pipeliner.py radioastro/meqtrees"
alias miriad_umd="echo \"You can now issue miriad commands\"; docker run ${DOCKER_OPTS} miriad_3gciv"
alias miriad_csiro="echo \"You can now issue miriad commands\"; docker run ${DOCKER_OPTS} miriad_csiro_3gciv"
#alias tigger="docker run ${DOCKER_OPTS} --entrypoint tigger radioastro/meqtrees"
alias notebook_runner="docker run ${DOCKER_OPTS} notebooks_3gciv"
alias ds9="docker run ${DOCKER_OPTS} --entrypoint ds9 notebooks_3gciv"
alias gipsy_aladin_tomcat="docker run ${DOCKER_OPTS} gipsy_patch_3gciv"
alias gipsy_only="docker run ${DOCKER_OPTS} --entrypoint \"/home/gipsy/gipsy_install/sys/gipsy.csh\" gipsy_patch_3gciv"
alias karma="echo \"You can now issue any KARMA commands, including kvis\"; docker run ${DOCKER_OPTS} karma_patch_3gciv"
alias kvis="docker run ${DOCKER_OPTS} --entrypoint kvis karma_patch_3gciv"
alias kpvslice="docker run ${DOCKER_OPTS} --entrypoint kpvslice karma_patch_3gciv"

alias wsclean="docker run ${DOCKER_OPTS} wsclean_3gciv"
alias aoflagger_run="echo \"You can now run any aoflagger tasks, including the rfi gui\"; docker run ${DOCKER_OPTS} aoflagger_3gciv"
alias runpurify="docker run ${DOCKER_OPTS} --entrypoint bash purify_3gciv"

#AIPS
#if [ ! -d /scratch/${USER}/LOCALHOST_2 ]; then
#   mkdir /3gciv_data/${USER}/LOCALHOST_2 && touch /3gciv_data/${USER}/LOCALHOST_2/SPACE
#fi
alias goaips="docker run ${DOCKER_OPTS} --volume=\"/3GCIV_MASTER/VAULT/RICK_PRAC:/usr/local/AIPS/FITS:ro\" -e AIPSMOUNT=\"/${HOME}\" --entrypoint /aipsrunner.sh aips_patch_3gciv"


alias runtirific="docker run ${DOCKER_OPTS} --entrypoint tirific tirific_3gciv"
alias sofia="docker run ${DOCKER_OPTS} sofia_1404_3gciv"
alias sofia_pipeline="docker run ${DOCKER_OPTS} --entrypoint sofia_pipeline.py sofia_1404_3gciv"
alias fat="docker run ${DOCKER_OPTS} fat_3gciv"
alias pybdsm="docker run ${DOCKER_OPTS} pybdsm_3gciv"
alias runsourcery="docker run ${DOCKER_OPTS} --entrypoint sourcery sourcery_3gciv"
alias DDF.py="docker run ${DOCKER_OPTS} ddf_3gciv"
alias pymoresane="runsane"
alias runsimms="docker run ${DOCKER_OPTS} --entrypoint simms simms_3gciv"
alias karoogp="docker run ${DOCKER_OPTS} karoogp_3gciv"
export PATH=/opt/wsclean1.12.develop/bin:/usr/local/meqtrees/pyxis/Pyxis/bin:$PATH:/usr/local/casa-release-4.7.0-el7/bin
export LD_LIBRARY_PATH=/opt/wsclean1.12.develop/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/usr/local/meqtrees/pyxis:/usr/local/meqtrees/Timba/install/symlinked-release/libexec/python:$PYTHONPATH
export PYTHONPATH=/usr/local/meqtrees/owlcat:/usr/local/meqtrees/pyxis:/usr/local/meqtrees/kittens:$PYTHONPATH
export PYTHONPATH=/usr/local/meqtrees/purr:/usr/local/meqtrees/tigger:$PYTHONPATH
