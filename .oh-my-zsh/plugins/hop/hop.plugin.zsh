# make hop work with zsh
#
function hop
{
    HOP_OUTPUT="$(hop-script $*)"
    array_of_lines=("${(@f)${HOP_OUTPUT}}")
    case $? in
    255 )
        cd $array_of_lines[2]
        ;;
    254 )
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
