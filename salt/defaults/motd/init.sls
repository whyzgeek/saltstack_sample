/etc/motd:
   file:
     - managed
     - template: mako
     - user: root
     - group: root
     - mode: 444
     - source: salt://motd/motd.mako
