current-openstack-instance: devcloud

openstack:
  devcloud:
    openstack-components:
      keystone:
        name: keystone
        password: keystone_pass 
      mysql:
        user: root
        password: mysql
 #   dbhost: db.yourdomain.com
        allow_host: '"%"'
        privileges: ALL PRIVILEGES
