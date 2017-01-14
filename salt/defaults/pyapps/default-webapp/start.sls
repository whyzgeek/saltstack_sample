#!mako|yaml

<%!
app_name = globals().get('_template_uri').split('/')[1]
 %>

${app_name}_start:
     cmd.run:
        - name: 'su - -c "cd /opt/share/${app_name}/ && etc/${app_name}.ini start"'
        - onlyif: ls /opt/share/${app_name}/buildout.cfg
        - order: last
