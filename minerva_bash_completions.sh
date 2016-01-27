# bash completion for seminar `./scripts/integrate test_*.py`
_complete_scripts_integrate()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    TESTS_DIR="./tests/integration"
    LOOK_FOR="test_*.py"
    pushd ${TESTS_DIR} > /dev/null
    TESTS=$(ls ${LOOK_FOR})
    COMPREPLY=( $(compgen -W "${TESTS}" -- $cur) )
    popd > /dev/null
}
complete -F _complete_scripts_integrate ./scripts/integrate

# support si alias
alias si='./scripts/integrate --exclude-canvas'
complete -F _complete_scripts_integrate si
