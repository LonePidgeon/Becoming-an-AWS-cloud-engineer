#!/bin/bash
# Deploys the website folder to S3 (uploads everything every run)
aws s3 cp ../website/ s3://<my-bucket>/ --recursive --acl public-read
