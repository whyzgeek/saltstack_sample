<%
env=pillar['hosts'][grains['id']]['env']
%>
env: ${env}
