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
    # jump to the filesystem location of a given Python module name
    pushd `python -c "import os.path, $1; print(os.path.dirname($1.__file__))"`;
}

gitgrep () {
    # grep through the git logs for the given string
    git log --pretty=oneline -S"$1"
}

mktun () {
    # Make an SSH reverse tunnel with the given host
    #
    # Usage: mktun host local_port remote_port
    local SERVER=$1
    local LOCALPORT=$2
    local REMOTEPORT=$3
    grep -qF $1 $HOME/.ssh/known_hosts || ssh-keyscan $SERVER >> $HOME/.ssh/known_hosts
    ssh -nNT -L "${LOCALPORT}:localhost:${REMOTEPORT}" $SERVER;
}

dash () {
    # open default browser to given dash location in beta
    local APIKEY=$1
    x-www-browser https://beta.parsely.com/$APIKEY;
}

vman () {
    # open a given man page in vim, to use vim as a pager
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

httpdiff () {
    # Issue two HTTP requests and do a colorized diff of the output
    diff -u <(curl -sS -D - -L $1) <(curl -sS -D - -L $2) | colordiff
}

ssh-host () {
    # Show SSH handshake debug output for given remote host
    ssh -v "$1" 2>&1 true | grep 'debug1: Connecting to' | sed -e's/debug1: Connecting to //g' | awk '{print $1}'
}

ssh-rm () {
    # Remove my public key from given remote host
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R $(ssh-host $1)
}

mdclean () {
    # Clean up the given .md (Markdown) file by running through commonmark
    pandoc -f markdown -t commonmark --atx-headers --wrap=none -s $1
}

md2pdf () {
    # Make a PDF from the given .md (Markdown) file; requires
    # us to set the PDF engine to use which is hard to remember
    # example: md2pdf markdown_text.md markdown_printable.pdf
    pandoc $1 --pdf-engine=xelatex -o $2
}

md2html () {
    # Pandoc will detect .html output format from the extension
    # example: md2html markdown_text.md markdown_html.html
    pandoc $1 -o $2
}

pdfuncompress () {
    # take a compressed pdf as input, and output as uncompressed pdf
    # example: pdfuncompress compressed.pdf uncompressed.pdf
    pdftk $1 output $2 uncompress;
}

pport () {
    # Print the pid of a process listening on the given TCP port
    lsof -i "TCP:$1" | grep LISTEN | awk '{print $2}'
}

pyenvthis () {
    # Set up a pyenv for the current directory based on the directory's name
    # and on the Python interpreter passed as argument to this function
    #
    # $ cd ~/py3 && pyenvthis 3.8.2
    #
    # Will set up a pyenv "py3" atop Python interpreter 3.8.2, and will also
    # create ~/py3/.python-version, update pip inside the pyenv, and activate.
    local curdir=$(basename $(pwd))
    if [[ "${1}" = "" ]]; then
        echo "No Python version specified; try e.g. pyenvthis 3.8.2";
        return;
    fi
    echo "Using Python [${1}] as basis for pyenv [${curdir}]";
    pyenv shell $1 && \
        echo "=> virtualenv:" &&\
        pyenv virtualenv $curdir && \
        pyenv local $curdir && \
        pyenv shell --unset && \
        echo "=> pip upgrade:" &&\
        pip install -U pip && \
        echo "=> python check:" &&\
        python -V && \
        python -c "import sys; print(sys.path[-1])" && \
        echo "=> Done.";
}

