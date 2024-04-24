{% set filecontent = salt['pillar.get']('filecontent', {}) %}

create-myfile:
  file.managed:
    - name: /root/file-monitor-test
    - source: salt://myfile/myfile
    - user: root
    - group: root
    - mode: 644

write-myfile:
  file.append:
    - name: /root/file-monitor-test
    - text: 
      - {{ filecontent }}
    - require:
      - file: create-myfile
