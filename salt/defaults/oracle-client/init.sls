oracle-client:                 
  pkg.installed:                  
    - names:
        - oracle-instantclient-basic
        - oracle-instantclient-devel

/etc/ld.so.conf.d/oracle-cx.conf:
    file:
        - managed
        - source: salt://oracle-client/oracle-cx.conf
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - require:
            - pkg: oracle-instantclient-basic
/sbin/ldconfig:
     cmd:
        - wait
        - watch:
            - file: /etc/ld.so.conf.d/oracle-cx.conf
