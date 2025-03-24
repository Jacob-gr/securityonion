# This reactor triggers the mine_update orchestration when it receives a mine_update event

trigger_mine_update_orchestration:
  runner.state.orchestrate:
    - args:
      - mods: orch.mine_update
      - pillar:
          minion_id: {{ data['id'] }}
