# pkg.install
vim:
  pkg:
    % if grains['os'] == 'CentOS' or grains['os'] == 'Fedora':
    - name: vim-enhanced
    % elif grains['os'] == 'Debian':
    - name: vim-runtime
    % endif
    - purged

/etc/vimrc:
  file:
    - absent
    - user: root
    - group: root
    - mode: 644
    - template: mako
    - makedirs: True
    - require:
      - pkg: vim
