#!/bin/bash
# REQUIRES THE FOLLOWING ENVIRONMENT VARIABLES:
# SLACK_CHANNELS=list,of,comma,delimited,channel,ids,to,notify
# SLACK_OAUTH_BEARER=oauth bearer token to post to slack
curl -F file="@${1}" \
  -F "initial_comment=Captured_video: ${2}" \
  -F channels=${SLACK_CHANNELS} \
  -F filetype=mp4 \
  -H "Authorization: Bearer ${SLACK_OAUTH_BEARER}" \
  https://slack.com/api/files.upload
