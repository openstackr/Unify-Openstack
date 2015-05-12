cinder_setup:
  salt.state:
    - tgt: 'function:storage'
    - tgt_type: grain
    - sls:
        - cinder.storage.install
        - cinder.storage.configure
        - cinder.storage.start
