# current-openstack-instance is expected to be give on the commandline
# if not, the value below will be used.
current-openstack-instance: devcloud

openstack-instance:
  devcloud:
    openstack-id: devcloud
    minions:
      controller:
        role: mysql
        mysql-cluster-id: mysql-cluster1
        mysql-is-master: true

      compute:
        role: mysql
        mysql-cluster-id: mysql-cluster1
        mysql-is-master: false

      network:
        haproxy: mysql 

    openstack-components:
      keystone:
        name: keystone
        password: keystone_pass
        conn_token: admin

      mysql:
        conn_user: root
        conn_password: mysql
    
      rabbitmq:
        rabbitmq_username: rabbitmq
        rabbitmq_password: password 

      nova: 
        controller:
          name: nova
          password: nova_pass
          email: nova@test.com

        compute: 
          my_ip: localhost
          glance_host: controller
          virt_type: kvm 


