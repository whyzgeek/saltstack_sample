/etc/init.d/webservices:
   file:
     - managed
     - template: mako
     - user: root
     - group: root
     - mode: 777
     - source: salt://pyapps-all/webservices.mako
   service:
     - name: webservices
     - running
     - enable: True
     - require:
        - file: /etc/init.d/webservices
     - watch:
        - file: /etc/init.d/webservices
