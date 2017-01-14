redis-pkg:                 
    pkg.installed:                  
        - names:
             - redis
/etc/redis.conf:
    file:
        - managed
        - source: salt://redis/redis.conf.mako
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
        - require:
            - pkg: redis
db_directory:
    file.directory:
        - name: ${pillar['db_target']}/lib/redis/
        - user: root
        - group: root
        - mode: 755
        - makedirs: True
redis:
     service:
            - running
            - enable: True
            - watch:
                - file: /etc/redis.conf
            - require:
                - file: db_directory
            
    
