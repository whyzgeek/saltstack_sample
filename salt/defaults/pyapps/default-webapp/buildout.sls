<%!
app_name = globals().get('_template_uri').split('/')[1]
 %>
${app_name}_buildout:
     cmd.run:
        - name: sudo -u root su - -c "cd ${pillar['pyapps']}/${app_name}/ && env -i ${pillar['buildout_env']} buildout-testing-index-url=${pillar['egg_repo']} bin/buildout"
        - onlyif: ls ${pillar['pyapps']}/${app_name}/buildout.cfg
        - order: 8
