disable_selinux:
    pkg.installed:
        - name: selinux-policy-targeted
/etc/selinux/config:
  file:
    - managed
    - source: salt://selinux/config
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: selinux-policy-targeted
# We ensure current state is disabled
echo 0 > /selinux/enforce:
    cmd:
        - run
        - require:
          - pkg: selinux-policy-targeted
