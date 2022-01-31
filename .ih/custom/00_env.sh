#!/bin/sh

# This file defines the user-specific environment variables
# which are expected by other engineering scripts,
# as well as any additional things you want to add.

# This file will not be updated when you update the ih-core brew formula.

# Directory where you want to clone Legacy Grand Rounds repos,
# which are currently located in the ConsultingMD org.
export GR_HOME="$HOME/src/github.com/ConsultingMD"

# Directory where you want to clone Legacy Doctor on Demand repos,
# which are currently located in the doctorondemand org.
export DOD_HOME="$HOME/src/github.com/doctorondemand"

# Your GitHub username
export GITHUB_USER="SteveRuble"

# Your email address
export EMAIL_ADDRESS="steve.ruble@includedhealth.com"
export GITHUB_EMAIL_ADDRESS="steve.ruble@users.noreply.github.com"

# Your 3 character initials
export INITIALS="SMR"

# Your full name, the name you would introduce yourself with.
export FULL_NAME="Steve Ruble"

# Your username, probably firstname.lastname
export IH_USERNAME="steve.ruble"
# This is copied for legacy compatibility
export GR_USERNAME="$IH_USERNAME"

# The username you have in JIRA.
# Before 1/15/2022:
# If you've already logged in to JIRA with an email address,
# use that. Otherwise, if you're new, use "$GR_USERNAME@grandrounds.com"
# After 1/15/2022:
# Use $GR_USERNAME@includedhealth.com
export JIRA_USERNAME="steve.ruble@grandrounds.com"

# This is the default value used to authenticate to AWS resources
# using the aws-environment script. Most people don't need to change this.
export AWS_DEFAULT_ROLE=developer
export EDITOR="code --wait"
