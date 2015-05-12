enp0s8:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - bridge: br-int

br-int:
  network.managed:
    - enabled: True
    - type: bridge
    - proto: dhcp
    - bridge: br-int
    - delay: 0
    - ports: enp0s8
    - bypassfirewall: True
    - use:
      - network: enp0s8
    - require:
      - network: enp0s8
