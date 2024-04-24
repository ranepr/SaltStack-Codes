restore-indexphp:
  file.managed:
    - name: /var/www/opencart/index.php
    - source: salt://opencart/hacked.php
    - user: www-data
    - group: www-data
    - mode: 755
