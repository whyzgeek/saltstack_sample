# This file is managed by saltstack
Defaults    !requiretty
<%
env=pillar['hosts'][grains['id']]['env']
%>
% for k, v in pillar['sudoers'].get(env).items():
  % if k == 'users':
    % for usr in pillar['sudoers'].get(env).get('users'):
${usr}   ALL=(ALL:ALL)   NOPASSWD:ALL
    % endfor
  % endif
  % if k == 'groups':
    % for grp in pillar['sudoers'].get(env).get('groups'): 
%%${grp} ALL=(ALL:ALL)    NOPASSWD:ALL
    % endfor
  % endif
% endfor
