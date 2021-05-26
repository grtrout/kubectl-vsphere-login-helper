#!/usr/bin/env bash
# vsphere-login.sh
# Author: Greg Trout | grtrout@gmail.com

# Default variables
USERID='user@domain'
SERVERIP='10.0.1.10'
DEFAULT_SUPERVISOR_NAMESPACE='supervisor-ns'

# Use default cluster variables if no parameters provided
if [ $# == 0 ]
then
  VSLCMD_ARGS=""
fi

# If only one parameter is provided, assume it's the guest cluster name
if [ $# == 1 ]
then
  TKG_CLUSTER="$1"	
  TKG_CLUSTER_NS="$DEFAULT_SUPERVISOR_NAMESPACE"
  VSLCMD_ARGS=" --tanzu-kubernetes-cluster-name $TKG_CLUSTER --tanzu-kubernetes-cluster-namespace $TKG_CLUSTER_NS"
fi

# If two parameters are provided, assume they are the cluster and the namespace
if [ $# == 2 ]
then
  TKG_CLUSTER="$1"
  TKG_CLUSTER_NS="$2"
  VSLCMD_ARGS=" --tanzu-kubernetes-cluster-name $TKG_CLUSTER --tanzu-kubernetes-cluster-namespace $TKG_CLUSTER_NS"
fi

VSLCMD_1="kubectl vsphere login --vsphere-username $USERID --server https://$SERVERIP"
VSLCMD="${VSLCMD_1}${VSLCMD_ARGS}"

printf "$VSLCMD\n"
$VSLCMD

