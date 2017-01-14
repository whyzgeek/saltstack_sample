/etc/ssh/ssh_config:
    file:
        - managed
        - source: salt://ssh_client/ssh_config
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
