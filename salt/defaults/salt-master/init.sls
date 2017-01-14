salt-master:
    pkg:
        - installed
    service:
        - running
        - enable: True
/etc/salt/master:
    file:
        - managed
        - source: salt://salt-master/master
        - user: root
        - group: root
        - mode: 644 
        - makedirs: True
        - require:
            - pkg: salt-master
