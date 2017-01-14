<%
env = pillar['hosts'][grains['id']]['env']
for p_env in pillar['envs'].keys():
    if p_env == env:
        root_conf = pillar['envs'][env]
%>
# Author: Kiarash Bodouhi
# version 1.1

[buildout]
extends = profiles/production.cfg
# Comment above and uncomment below lines
# to activate the development profile.
#extends = profiles/development.cfg

# Local PiPy Repo
# Ensure these settings are also reflected
# In your ~/.pipyrc file
index = ${pillar['egg_repo']}
find-links = ${pillar['egg_repo']}
allow-hosts = *

# In development mode you might need
# uncomment following and fill in with
# your username.
#[server]
#user = kibo
#group = kibo
