#!/bin/bash
# Requires just one env var:
# SLACK_NOTIFY_WEBHOOK
curl -X POST -H 'Content-type: application/json' \
  --silent \
  --data "{\"text\":\"${1}\"}" \
  "${SLACK_NOTIFY_WEBHOOK}"