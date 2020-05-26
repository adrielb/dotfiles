#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# https://about.gitlab.com/install/#debian

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo EXTERNAL_URL="https://whisper-quiet.local:2443" apt-get install gitlab-ee

exit 0

#
# Reconfigure GitLab for the changes to take effect:

sudo gitlab-ctl reconfigure

# Restart the services so that Sidekiq picks up the changes

sudo gitlab-ctl restart
