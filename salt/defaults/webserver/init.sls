apache:                 # ID declaration
    pkg:                  # state declaration
        - name: httpd
        - installed         # function declaration
    service:
        - name: httpd
        - running
    file:
        - managed
        - name: /var/www/html/index.html
        - source: salt://webserver/index.html

