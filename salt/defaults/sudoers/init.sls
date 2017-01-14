/etc/sudoers.d/salt-sudoers:
    file:
        - managed
        - source: salt://sudoers/salt-sudoers.mako
        - user: root
        - group: root
        - mode: 400
        - template : mako
        - makedirs: True
