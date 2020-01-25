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

pycd () {
    pushd `python -c "import os.path, $1; print(os.path.dirname($1.__file__))"`;
}

gitgrep () {
    git log --pretty=oneline -S"$1"
}

mktun () {
    # Usage: mktun host local_port remote_port
    local SERVER=$1
    local LOCALPORT=$2
    local REMOTEPORT=$3
    grep -qF $1 $HOME/.ssh/known_hosts || ssh-keyscan $SERVER >> $HOME/.ssh/known_hosts
    ssh -nNT -L "${LOCALPORT}:localhost:${REMOTEPORT}" $SERVER;
}

dash () {
    local APIKEY=$1
    x-www-browser https://beta.parsely.com/$APIKEY;
}

vman () {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

httpdiff () {
    diff -u <(curl -sS -D - -L $1) <(curl -sS -D - -L $2) | colordiff
}

ssh-host () {
    ssh -v "$1" 2>&1 true | grep 'debug1: Connecting to' | sed -e's/debug1: Connecting to //g' | awk '{print $1}'
}

ssh-rm () {
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R $(ssh-host $1)
}

mdclean () {
    pandoc -f markdown -t commonmark --atx-headers --wrap=none -s $1
}

md2pdf () {
    pandoc $1 --pdf-engine=xelatex -o $2
}

pport () {
    lsof -i "TCP:$1" | grep LISTEN | awk '{print $2}'
}
