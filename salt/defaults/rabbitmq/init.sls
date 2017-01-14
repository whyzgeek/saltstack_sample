rabbitmq-pkg:                 
    pkg.installed:                  
        - names:
             - rabbitmq-server
/etc/rabbitmq/enabled_plugins:
    file:
        - managed
        - source: salt://rabbitmq/enabled_plugins
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - require:
            - pkg: rabbitmq-server
/var/lib/rabbitmq/.erlang.cookie:
    file:
        - managed
        - source: salt://rabbitmq/erlang.cookie
        - user: rabbitmq
        - group: rabbitmq
        - mode: 600
        - makedirs: True
        - require:
            - pkg: rabbitmq-server
/etc/rabbitmq/rabbitmq-env.conf:
    file:
        - managed
        - source: salt://rabbitmq/rabbitmq-env.conf.mako
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
        - require:
            - file: /etc/rabbitmq/enabled_plugins
/etc/rabbitmq/rabbitmq.config:
    file:
        - managed
        - source: salt://rabbitmq/rabbitmq.config.mako
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
        - require:
            - file: /etc/rabbitmq/rabbitmq-env.conf
queue_directory:
    file.directory:
        - name: ${pillar['db_target']}/rabbitmq
        - user: rabbitmq
        - group: rabbitmq
        - mode: 755
        - makedirs: True
        - require:
            - file: /etc/rabbitmq/rabbitmq.config
            - file: /var/lib/rabbitmq/.erlang.cookie
rabbitmq-server:
     service:
            - running
            - enable: True
            - watch:
                - file: /etc/rabbitmq/rabbitmq.config
            - require:
                - file: queue_directory    
/usr/sbin/rabbitmqadmin:
    file:
        - managed
        - source: salt://rabbitmq/rabbitmqadmin
        - user: root
        - group: root
        - mode: 755
