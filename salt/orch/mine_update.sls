# Get the minion ID from the pillar
{% set MINION_ID = salt['pillar.get']('minion_id') %}

# Run mine.update on all minions
update_mine_all_minions:
  salt.function:
    - name: mine.update
    - tgt: '*'
    - batch: 50
    - retry:
        attempts: 3
        interval: 1

# Run highstate on the original minion
run_highstate_on_original_minion:
  salt.state:
    - tgt: {{ MINION_ID }}
    - highstate: True
    - queue: True
    - require:
        - salt: update_mine_all_minions
