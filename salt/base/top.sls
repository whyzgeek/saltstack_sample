# If you want to override all environments with
# one module define it in base. 'base' takes precedents.
base:
    '*':
        - core
# Don't change anything beyond this point
# Use pillar hosts.sls file
% for env in pillar['envs'].keys():
<% exist = False %>
${env}:
    % for host in pillar['hosts'].keys():
        % if pillar['hosts'][host]['env'] == env:
            <% exist = True %>
    ${host}:
        % for role in pillar['hosts'][host]['roles'].keys():
        - ${role}
        % endfor
        % endif
% endfor
% if not exist:
    '*':
        - empty
% endif 
% endfor
