#!/usr/bin/env bash
# kvl-shell-automation.sh (for vsphere login helper)
# Author: Greg Trout | grtrout@gmail.com

_kube_contexts()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ) );
}

complete -F _kube_contexts kvl

alias kvl="$HOME/kvl/vsphere-login.sh"
kvlc() { kvl $(kubectl config current-context) ; }

