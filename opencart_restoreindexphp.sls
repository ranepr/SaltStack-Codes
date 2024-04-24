set-delay:
  cmd.run:
    - name: sleep 10

restore-indexphp:
  file.managed:
    - name: /var/www/opencart/index.php
    - source: salt://opencart/index.php
    - user: www-data
    - group: www-data
    - mode: 755
