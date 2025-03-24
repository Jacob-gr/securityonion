# This state sends an event to the salt-master event bus
# The event will be caught by the reactor and trigger the mine_update orchestration

send_mine_update_event:
  module.run:
    - name: event.send
    - tag: salt/minion/{{grains.id}}/mine_update
