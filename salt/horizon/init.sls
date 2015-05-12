horizone_setup:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain
    - sls:
        - horizon.install
        - horizon.configure
        - horizon.start
