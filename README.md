# saltstack_sample

This is sample saltstack template to configure and install whole platform of servers.

The main design characteristics are:

* everything is driven by pillars dynamically (check the comments inside)
* salt states are dynamically generated from pillars via mako templates
* all environments [live, qa, test] are controlled from single saltmaster and 
single git repo and branch. This is to avoid confusions caused by merging files between
environments.

# Usage

in pillars folder update users.sls, hosts.sls and general.sls then run:

```
salt '192.168.2.10' state.highstate 

```

To override behaviour of specific environment/application you can copy paste the
content of the default folders in a newly named directory similar to pyapps.

