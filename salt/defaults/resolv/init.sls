/etc/resolv.conf:
    file:
        - managed
        - source: salt://resolv/resolv.conf
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
