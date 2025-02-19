# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- set sls_enable_check = tplroot ~ '.check' %}
{%- from tplroot ~ "/map.jinja" import mapdata as TEMPLATE with context %}

include:
  - {{ sls_enable_check }}
  - {{ sls_service_clean }}

TEMPLATE-config-clean-file-absent:
  file.absent:
    - name: {{ TEMPLATE.config }}
    - require:
      - sls: {{ sls_service_clean }}
