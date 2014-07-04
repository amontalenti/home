# make hop work with zsh
#
function hop
{
    HOP_OUTPUT="$(hop-script $*)"
    array_of_lines=("${(@f)${HOP_OUTPUT}}")
    case $? in
    255 )
        read THE_NAME THE_PATH <<<$PATH_OR_OUTPUT
        cd $array_of_lines[2]
        ;;
    254 )
        read THE_NAME THE_SERVER <<<$PATH_OR_OUTPUT
        ssh $array_of_lines[2]
        ;;
    *)
        echo "${HOP_OUTPUT}"
        ;;
    esac
}


_hop_complete()
{
    compadd `hop --autocomplete`
}

compdef _hop_complete hop
