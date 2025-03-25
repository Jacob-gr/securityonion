reactor_config_hypervisor:
  file.managed:
    - name: /etc/salt/master.d/reactor_mine_update.conf
    - contents: |
        reactor:
          - 'salt/minion/*/mine_update':
            - salt://reactor/mine_update.sls
    - group: root
    - mode: 644
    - makedirs: True
    - watch_in:
      - service: salt_master_service
    - order: last
