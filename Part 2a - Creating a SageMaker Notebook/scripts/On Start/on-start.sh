#!/bin/bash

set -e

# Setting the timeout (in seconds) for how long the SageMaker notebook can run idly before being auto-stopped
IDLE_TIME = 3600

# Getting the autostop.py script from GitHub
echo "Fetching the autostop script..."
wget https://raw.githubusercontent.com/dkhundley/terraform-sagemaker-tutorial/main/Part%202a%20-%20Creating%20a%20SageMaker%20Notebook/scripts/On%20Start/autostop.py

# Using crontab to autostop the notebook when idle time is breached
echo "Starting the SageMaker autostop script in cron."
(crontab -l 2>/dev/null; echo "*/5 * * * * /usr/bin/python $PWD/autostop.py --time $IDLE_TIME --ignore-connections") | crontab -