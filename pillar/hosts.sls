# To have a machine with core modules.
# only add 'empty:' role as placeholder
hosts:        
     192.168.2.8:
        desc: "salt master and all repos (git, yum)"
        env: live
        roles:
            python-stack: True  # We use version as value if True means whatever that's available
            salt-master: True
     192.168.2.10: 
        desc: "Test App Server"
        env: test
        roles:
            python-stack: True
            redis: True
            pyapps.default-webapp: '1.0'  # Sample should be changed
            dev-tools: True
            cassandra: True
            rabbitmq: True
     #############################################################
     # Prod Apps
     # They both usually should have the same
     # config
     192.168.1.10:
        desc: "App server 1"
        env: live
        roles:
            pyapps.default-webapp: '1.0'  # Sample should be changed
            redis: True
            python-stack: True
            cassandra: True
            rabbitmq: True
     192.168.1.11:
        desc: "App server 2"
        env: live
        roles:
            redis: True
            python-stack: True
            pyapps.default-webapp: '1.0'  # Sample should be changed
            cassandra: True
            rabbitmq: True
            rabbitmq: True
     ## Prod Splunk machines
     192.168.1.12:
        desc: "Splunk Main Server"
        env: live
        roles:
            splunk: True
