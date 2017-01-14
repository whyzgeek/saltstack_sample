include:
    - dev-tools
python-stack:                 
  pkg.installed:                  
    - names:
        - python27
        - python27-setuptools
        - python27-buildout
        - python-devel
/root/.pydistutils.cfg:
  file:
    - managed
    - source: salt://python-stack/pydistutils.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: python27-buildout
