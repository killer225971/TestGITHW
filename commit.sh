#!/bin/bash


TASKID=$1
DEV_MESSAGE=$2

if [ -z "$TASKID" ]; then
  echo "Error: Task ID is required."
  exit 1
fi

if [ -z "$DEV_MESSAGE" ]; then
  echo "Error: Developer message is required."
  exit 1
fi

CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH_NAME" == "main" ]; then
  NEW_BRANCH="BR_$TASKID"
  git checkout -b "$NEW_BRANCH"
  BRANCH_NAME="$NEW_BRANCH"
  echo "Created and switched to branch: $NEW_BRANCH"
fi

DEV_NAME=$(git config user.name)

COMMIT_MESSAGE="$TASKID – $CURRENT_DATETIME – $BRANCH_NAME – $DEV_NAME – Task Description – $DEV_MESSAGE"

git add .
git commit -m "$COMMIT_MESSAGE"

echo "Pushing changes to GitHub..."
git push --set-upstream origin "$BRANCH_NAME"

echo "Commit pushed successfully to GitHub!"