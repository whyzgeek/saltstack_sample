<%
app_name = globals().get('_template_uri').split('/')[1]
 %>
<%
for role,version in pillar['hosts'][grains['id']]['roles'].iteritems():
    if app_name in str(role):
        full_appname, app_version = (role, version)
%>
include:
    - pyapps-all
${app_name}:
     git.latest:
        - name: ${pillar['scm_repo']}:buildout/${app_name}
        - target: ${pillar['pyapps']}/${app_name}
        - rev: '${app_version}'
        - submodules: True
        - onlyif: ls /root/.ssh/id_rsa.deploy 
        - order: 5
        - require:
            - sls: python-stack
     cmd.wait:
        - cwd: ${pillar['pyapps']}/${app_name}
        - name: '/usr/local/bin/buildout init'
        - watch:
            - git: ${app_name}
        - unless: ls ${pillar['pyapps']}/${app_name}/buildout.cfg
        - order: 6
        - require:
            - sls: python-stack
     file.managed:
        - name: ${pillar['pyapps']}/${app_name}/buildout.cfg
        - source: salt://pyapps/${app_name}/buildout.cfg.mako
        - template: mako
        - order: 7
        - require:
            - sls: python-stack

