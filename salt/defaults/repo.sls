# Deleting all standard repos
# Changes to repos are not reflected
# So if you have a change first remove the repo
rm /etc/yum.repos.d/*.repo:
    cmd:
        - run
        - unless: test -e /etc/yum.repos.d/NEW-CentOS.repo
NEW-CentOS:
    pkgrepo.managed:
        - humanname: NEW-CentOS
        - baseurl: ${pillar['centos_repo']}
        - gpgcheck: 0
NEW-Test:
    pkgrepo.managed:
        - humanname: NEW-Test
        - baseurl: ${pillar['yum_repo']}
        - gpgcheck: 0

