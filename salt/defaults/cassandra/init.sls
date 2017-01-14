cassandra-pkg:                 
    pkg.installed:                  
        - names:
             - java-1.7.0-openjdk
             - dsc20
/etc/cassandra/conf/cassandra.yaml:
    file:
        - managed
        - source: salt://cassandra/cassandra.yaml.mako
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - template: mako
        - require:
            - pkg: dsc20
db_directory:
    file.directory:
        - name: ${pillar['db_target']}/cassandra
        - user: cassandra
        - group: cassandra
        - mode: 755
        - makedirs: True
        - require:
            - file: /etc/cassandra/conf/cassandra.yaml
cassandra:
     service:
            - running
            - enable: True
            - watch:
                - file: /etc/cassandra/conf/cassandra.yaml
            - require:
                - file: db_directory
            
    
