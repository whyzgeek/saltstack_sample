# pkg.install
time_sync:
    pkg:
        - installed
        - name: ntp
    file.managed:
        - name: /etc/ntp.conf
        - source: salt://ntp/ntp.conf
        - template: mako
    service:
        - name: ntpd
        - running
        - enable: True
        - require:
            - pkg: ntp
        - watch:
            - file: /etc/ntp.conf
