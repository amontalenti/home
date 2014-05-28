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

function ccd () {
    autoenv_cd $COGROOT/$1;
}

function gitgrep () {
    git log --pretty=oneline -S"$1"
}

function sshtunnel() {
    local LOCALPORT=$1
    local REMOTEPORT=$2
    local SERVER=$3
    ssh -nNT -L $LOCALPORT:localhost:$REMOTEPORT $SERVER;
}

function dash() {
    local APIKEY=$1
    x-www-browser http://dash.to/$APIKEY;
}
