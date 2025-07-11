# Copyright Security Onion Solutions LLC and/or licensed to Security Onion Solutions LLC under one
# or more contributor license agreements. Licensed under the Elastic License 2.0 as shown at 
# https://securityonion.net/license; you may not use this file except in compliance with the
# Elastic License 2.0.

{% from 'allowed_states.map.jinja' import allowed_states %}
{% if sls.split('.')[0] in allowed_states %}
{%   from 'vars/globals.map.jinja' import GLOBALS %}
{%   set KAFKA_EXTERNAL_ACCESS = salt['pillar.get']('kafka:config:external_access:enabled', default=False) %}
{%   set KAFKA_EXTERNAL_USERS = salt['pillar.get']('kafka:config:external_access:remote_users', default=None) %}

kafka_group:
  group.present:
    - name: kafka
    - gid: 960

kafka_user:
  user.present:
    - name: kafka
    - uid: 960
    - gid: 960
    - home: /opt/so/conf/kafka
    - createhome: False

kafka_home_dir:
  file.absent:
    - name: /home/kafka

kafka_sbin_tools:
  file.recurse:
    - name: /usr/sbin
    - source: salt://kafka/tools/sbin
    - user: 960
    - group: 960
    - file_mode: 755

kafka_sbin_jinja_tools:
  file.recurse:
    - name: /usr/sbin
    - source: salt://kafka/tools/sbin_jinja
    - user: 960
    - group: 960
    - file_mode: 755
    - template: jinja
    - defaults:
        GLOBALS: {{ GLOBALS }}

kafka_log_dir:
  file.directory:
    - name: /opt/so/log/kafka
    - user: 960
    - group: 960
    - makedirs: True

kafka_data_dir:
  file.directory:
    - name: /nsm/kafka/data
    - user: 960
    - group: 960
    - makedirs: True

{%   for sc in ['server', 'client'] %}
kafka_kraft_{{sc}}_properties:
  file.managed:
    - source: salt://kafka/etc/{{sc}}.properties.jinja
    - name: /opt/so/conf/kafka/{{sc}}.properties
    - template: jinja
    - user: 960
    - group: 960
    - makedirs: True
    - show_changes: False
{%   endfor %}

{%   if KAFKA_EXTERNAL_ACCESS and KAFKA_EXTERNAL_USERS != None %}
kafka_server_jaas_properties:
  file.managed:
    - source: salt://kafka/etc/jaas.conf.jinja
    - name: /opt/so/conf/kafka/kafka_server_jaas.conf
    - template: jinja
    - user: 960
    - group: 960
    - show_changes: False
{%   else %}
remove_kafka_server_jaas_properties:
  file.absent:
    - name: /opt/so/conf/kafka/kafka_server_jaas.conf
{%   endif %}

kafka_log4j_properties:
  file.managed:
    - source: salt://kafka/etc/log4j.properties
    - name: /opt/so/conf/kafka/log4j.properties
    - user: 960
    - group: 960
    - show_changes: False

reset_quorum_on_changes:
  cmd.run:
    - name: rm -f /nsm/kafka/data/__cluster_metadata-0/quorum-state
    - onchanges:
      - file: /opt/so/conf/kafka/server.properties

{% else %}

{{sls}}_state_not_allowed:
  test.fail_without_changes:
    - name: {{sls}}_state_not_allowed

{% endif %}