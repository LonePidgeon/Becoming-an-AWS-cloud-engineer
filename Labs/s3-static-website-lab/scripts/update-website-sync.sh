#!/bin/bash
# Deploys only changed files to S3 (faster than cp --recursive)
aws s3 sync ../website/ s3://<my-bucket>/ --acl public-read
