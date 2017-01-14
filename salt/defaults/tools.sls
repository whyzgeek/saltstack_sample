#list of useful packages we really want to have everywhere
#tools for troubleshooting
basic:
  pkg:
    - installed
    - names:
      - tcpdump
      - iotop
      - iptraf
      - nmap
      - screen
      - strace
      - procps
      - telnet
      - ftp
      - lftp
      - nc
    - skip_verify: True
