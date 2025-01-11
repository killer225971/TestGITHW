#!/bin/bash

# Parameters: Task ID and Task Description
TASKID=$1
TASK_DESC=$2

# Validate Inputs
if [ -z "$TASKID" ] || [ -z "$TASK_DESC" ]; then
  echo "Error: Task ID and Task Description are required."
  exit 1
fi

# Format Branch Name
BRANCH_NAME="BR_$TASK_DESC"

# Create and Switch to Branch
git checkout -b "$BRANCH_NAME"

# Push Branch to GitHub
git push --set-upstream origin "$BRANCH_NAME"

echo "Branch $BRANCH_NAME created and pushed to GitHub for Task ID: $TASKID"