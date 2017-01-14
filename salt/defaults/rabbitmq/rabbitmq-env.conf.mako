<% env = pillar['hosts'][grains['id']]['env'] %>
# ${pillar['do_not_modify']}
RABBITMQ_NODENAME=rabbit@${grains['id'].split('.')[0]}
RABBITMQ_MNESIA_BASE=${pillar['db_target']}/rabbitmq
