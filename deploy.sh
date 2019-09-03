#!/bin/bash
set -e
set -o pipefail

if [[ "$GITHUB_REF" != "refs/heads/deploy-to-s3" ]]; then
	echo "$GITHUB_REF was not deploy-to-s3, exiting..."
	exit 0
fi

echo "On branch ${GITHUB_REF}, deploying..."

(
cd /usr/src
make aws-apply TERRAFORM_FLAGS=-auto-approve
)
