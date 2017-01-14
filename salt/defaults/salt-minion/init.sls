salt-minion:
    pkg:
        - installed
    service:
        - running
        - enable: True
/etc/salt/grains:
    file:
        - managed
        - source: salt://salt-minion/grains.mako
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
