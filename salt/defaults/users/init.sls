% for grp, gobj in pillar['groups'].items():
${grp}:
  group:
    - present
    - gid: ${gobj['gid']}

# Users
    % for usr, uobj in gobj['users'].items():
${usr}:
    user.present:
        - fullname: ${uobj['name']}
        % if 'shell' in usr: 
        - shell: ${uobj['shell']}
        % endif
        % if 'home' in usr:
        - home: ${uobj['home']}
        % endif
        % if 'password' in usr:
        - password: ${uobj['password']}
        % endif
        - uid: ${uobj['uid']}
        - gid: ${gobj['gid']}
    % if 'groups' in uobj: 
        - groups:
    % for egrp in uobj['groups']:
            - ${egrp}
    % endfor 
    % endif 
# User pki authentication
% if 'pkey' in uobj: 
ssh_${usr}:
    ssh_auth:
        - present
        - user: ${usr}
        - source: salt://pub_keys/${usr}.pub
        - require:
            - user: 
                ${usr}
% endif
% endfor
# end of users definition
% endfor

