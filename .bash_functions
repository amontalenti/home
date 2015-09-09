# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

function pycd () {
    pushd `python -c "import os.path, $1; print os.path.dirname($1.__file__)"`;
}

function watchdir () {
    # installed via pip install watchdog; monitors a directory and runs command
    # upon any Python file changes
    watchmedo shell-command --drop --command=$1 --recursive --pattern="*.py";
}

function ccd () {
    autoenv_cd $COGROOT/$1;
}

function gitgrep () {
    git log --pretty=oneline -S"$1"
}

function mktun() {
    # Usage: mktun host local_port remote_port
    local SERVER=$1
    local LOCALPORT=$2
    local REMOTEPORT=$3
    grep -qF $1 $HOME/.ssh/known_hosts || ssh-keyscan $SERVER >> $HOME/.ssh/known_hosts
    ssh -nNT -L "${LOCALPORT}:localhost:${REMOTEPORT}" $SERVER;
}

function sshforce() {
    local SERVER=$1
    ssh-keygen -f ~/.ssh/known_hosts -R ${SERVER}
    ssh ${SERVER};
}

function dash() {
    local APIKEY=$1
    x-www-browser http://dash.to/$APIKEY;
}

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

function tunnels() {
    ssh -ND 8159 hack.cogtree.com &
}

[[ -s "$HOME/.workingon" ]] && source "$HOME/.workingon"
