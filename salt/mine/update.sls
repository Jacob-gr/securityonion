# This state sends an event to the salt-master event bus
# The event will be caught by the reactor and trigger the mine_update orchestration

{# may be able to use this method  if we can figure out multi state run failure - https://github.com/saltstack/salt/issues/66929 #}
# Get the minion ID from the pillar
{% set MINION_ID = grains.id %}

# Run mine.update on all minions
mine.update.update_mine_all_minions:
  salt.function:
    - name: mine.update
    - tgt: '*'
    - batch: 50
    - retry:
        attempts: 3
        interval: 1

# Run highstate on the original minion
# we can use concurrent on this highstate because no other highstate would be running when this is called
mine.update.run_highstate_on_{{ MINION_ID }}:
  salt.state:
    - tgt: {{ MINION_ID }}
    - highstate: True
    - concurrent: True
