{% set vcname = salt['pillar.get']('vcname', 'vcsa-01a.corp.local') %}
{% set cluster = salt['pillar.get']('cluster', 'RegionA01-COMP01') %}
{% set host = salt['pillar.get']('host', 'esx-05a.corp.local') %}

copy-script:
  file.managed:
    - name: E:\esxipatchsystem.ps1
    - source: salt://esxi/patchsystem.ps1

{% for cluster, hosts in salt['pillar.get'](vcname, {}).items() %}
{% for host in hosts %}
exec-patch-{{ host }}:
  cmd.run:
    - name: powershell -WindowStyle hidden -executionPolicy bypass -file "E:\esxipatchsystem.ps1" {{ vcname }} {{ cluster }} {{ host }}
    - runas: "Administrator"
    - password: "VMware1!"
    - require:
      - file: copy-script
{% endfor %}
{% endfor %}
