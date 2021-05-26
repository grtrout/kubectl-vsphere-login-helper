# kubectl-vsphere-login-helper
A few things to make the `kubectl vsphere login` process easier...  

## Installation
* For *.bashrc*, execute the `install.sh` script. 
  * This adds the `vsphere-login.sh` script to your PATH and sets the autocomplete and aliases to your startup script. 
* Reload your shell (e.g., `source ~/.bashrc`)

## Usage
* `vsphere-login.sh` can be executed with the alias `kvl`
* Default values are stored in `vsphere-login.sh`
  * These default cluster variables are used if no parameters are provided
    * Login to a guest cluster is only possible if a parameter is provided
* If only one parameter is provided, assume it's the guest cluster name
  * Example: `kvl guest123` 
* If two parameters are provided, assume they are the cluster and the supervisor namespace
  * Example: `kvl guest123 supervisor1`
* The alias `kvlc` will get your current kubectl context name and use that as the first parameter
* Other aliases can be made for common login scenarios. For example, `kvlg1` could be an alias for `kvl guest1`
* Autocomplete works for guest clusters. For example, typing `kvl` and then prompting for completion (e.g., *TAB*, *TAB*) will return the available contexts from your kubeconfig file