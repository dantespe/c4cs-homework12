# Globals
export COLLEGE=/Users/Dante/Documents/College
export PROJECTS=/Users/Dante/Documents/Projects
export MASTER=/Users/Dante/.iXE3U6PaDIlrhRPy
export UMICH=/Users/Dante/.IV8sjru8EfnDtRUy
export KEY=/Users/Dante/.fJJ9rhK5rPJ71YSuiNK1fGzxBCdf0nSw
export UMAIL=dantespe@umich.edu
export PMAIL=Spndnt2@gmail.com
export CLEAR_CLIP=120
export USERNAME="dantespe"
export CAEN="login.engin.umich.edu"

# Work Globals
export ANSIBLE=${PROJECTS}/ansible
export ROLES=${ANSIBLE}/roles
export AWX=${PROJECTS}/gitlab-awx-test
export WORK="studentpc1.arc.research.umich.edu"
alias p="cd $PROJECTS"
alias a="cd $ANSIBLE"
alias x="cd $AWX"

# Semester Globals
export SEM=${COLLEGE}/Winter2018
export E2=${SEM}/eecs482
export E5=${SEM}/eecs485
export E7=${SEM}/eecs376
export E9=${SEM}/eecs398
export C=${SEM}/cee265
alias s="cd $SEM"
alias 2="cd $E2"
alias 5="cd $E5"
alias 7="cd $E7"
alias 9="cd $E9"
alias c="cd $C"
alias web482="open http://web.eecs.umich.edu/~harshavm/eecs482/"
alias web485="open https://eecs485staff.github.io/eecs485.org/"
alias web398="open https://c4cs.github.io"
alias web265="open https://umich.instructure.com/courses/196696"
alias web376="open https://umich.instructure.com/courses/198368"

# PS Settings
if [ $(id -u) -eq 0 ];
then # you are root, set red color prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  export PS1="\u@\W $ "
fi


# History Config
export HISTCONTROL=ignoredups:erasedups # No duplicate entries
export HISTSIZE=25000                   # Big history
export HISTFILESIZE=100000              # Big History
export HISTTIMEFORMAT="%a %h %d - %r "
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# drivesync shortcuts
alias drivesync="python /Users/Dante/Documents/Projects/drive/mac/drivesync.py"
alias drivelogs="cat /Users/Dante/.Google/logs.txt"
alias clearlogs="rm -f /Users/Dante/.Google/logs.txt"

# unix-shotcuts
export CUSTOM_LS_OPTIONS="-Gh --color=auto"
alias ls="gls $CUSTOM_LS_OPTIONS"
alias ll="gls -l $CUSTOM_LS_OPTIONS"
alias la="gls -a $CUSTOM_LS_OPTIONS"
alias ps="ps aux"
alias sn="pmset sleepnow"
alias j="cd .."
alias h="cd ~"
alias su="su -l"
alias jsonify="jsonpp"
alias grep="grep -aE"
alias rr="cd /Users/Dante/Documents/College/Resume"
alias vb="vim ~/.bash_profile"
alias vs="open -a Visual\ Studio\ Code ." 

function jp() {
    cat $1 | jsonify > .tmp_12345678

    if [ $? -eq 0 ]; then
        mv .tmp_12345678 $1
    fi
}

function pcp () {
    cat $1 | pbcopy
}

function ppp() {
    pbpaste > $1
}

function ss() {
    source ~/.bash_profile
}

# passgens
alias cl="echo | pbcopy"
alias mp="cat $MASTER | pbcopy; ((sleep $CLEAR_CLIP; cl) &)"
alias umich="cat $UMICH | pbcopy; ((sleep $CLEAR_CLIP; cl) &)"
alias Passgend="Passgen -d | pbcopy; ((sleep $CLEAR_CLIP; cl) &)"
alias Passgendb="Passgen -d -b | pbcopy; ((sleep $CLEAR_CLIP; cl) &)"


# SSH Mods
function work {
    umich
    ssh $(echo $USERNAME)@$(echo $WORK)
}

function school {
    # export CAEN="login.engin.umich.edu" is SET ABOVE"
    umich # Copies UMICH pw
    wifi_name=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep "SSID" | tail -1 | cut -d ':' -f 2)

    if [ $wifi_name == "MWireless" ]; then
        export CAEN=oncampus-course.engin.umich.edu
    fi
    ssh $(echo $USERNAME)@$(echo $CAEN)
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Dante/Downloads/google-cloud-sdk/path.bash.inc' ]; then
    source '/Users/Dante/Downloads/google-cloud-sdk/path.bash.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Dante/Downloads/google-cloud-sdk/completion.bash.inc' ]; then
    source '/Users/Dante/Downloads/google-cloud-sdk/completion.bash.inc';
fi

# MacPorts Installer addition on 2017-10-29_at_12:28:03: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
alias python="python3"
alias pip="pip3"

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Root Protection
ROOT_USER_NAME=root
if [ $USER == $ROOT_USER_NAME ]; then
    PS1="\[\e[01;31m\]$PS1\[\e[00m\]"
fi
