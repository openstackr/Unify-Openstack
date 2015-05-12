{% from "mysql_server/files/map.jinja" import mysql with context %}
{% from "keystone/files/map.jinja" import keystone  with context %}

MySQL-python:
  pkg.installed


keystone_db:
  mysql_database.present:
    - name: {{ keystone.name }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
{% for host_list in ['localhost', '"%"'] %}
keystone_{{ host_list }}:
  mysql_user.present:
    - name: {{ keystone.name }} 
    - host: {{ host_list }}
    - password: {{ keystone.password }} 
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  mysql_grants.present:
    - host: {{ host_list }} 
    - grant: {{ mysql.privileges }}
    - database: '*.*'
    - user: {{ keystone.name }} 
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }} 
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

  require:
    - pkg: MySQL-python
{% endfor %}
