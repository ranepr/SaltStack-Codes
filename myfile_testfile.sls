{% set vcname = salt['pillar.get']('vcname', 'vcsa-01a.corp.local') %}
{% for cluster, hosts in salt['pillar.get'](vcname, {}).items() %}

write-file-{{ cluster }}:
  file.append:
    - name: /root/file-test
    - text:
    {% for host in hosts %}
      - {{ host }}
    {% endfor %}

{% endfor %}
