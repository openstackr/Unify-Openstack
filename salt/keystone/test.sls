
Keystone_tenants:
  keystone.tenant_present:
    - names:
      - admin
      - service
    - connection_token: admin

Keystone_roles:
  keystone.role_present:
    - names:
      - admin
      - member
    - connection_token: admin

Keystone_user:
  keystone.user_present:
    - name: admin
    - password: admin
    - email: admin@test.com
    - roles:
        admin:
          - admin 
          - member
        service:
          - admin
          - member
    - require:
      - keystone: Keystone_tenants
      - keystone: Keystone_roles
    - connection_token: admin

Keystone_service:
  keystone.service_present:
    - name: keystone
    - service_type: identity
    - description: Openstack identity
    - connection_token: admin

Keystone_endpoint:
  keystone.endpoint_present:
    - name: keystone
    - publicurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:5000/v2.0  
    - internalurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:5000/v2.0
    - adminurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:35357/v2.0
    - region: regionone
    - connection_token: admin
