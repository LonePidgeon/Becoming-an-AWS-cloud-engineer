# Café & Bakery – Static Website on Amazon S3

A hands-on AWS lab: deploying a static website to Amazon S3 using the AWS CLI from an EC2 instance, plus a repeatable deploy script.

## What this covers

- Configuring the AWS CLI on an EC2 instance
- Creating an S3 bucket (`aws s3api create-bucket`)
- Creating an IAM user with full S3 access and attaching the managed policy
- Enabling static website hosting on the bucket
- Uploading site files with public-read access
- Writing a bash script to redeploy the site on changes
- Optional: switching from `aws s3 cp` to `aws s3 sync` for efficient updates

## Repo structure

```
├── website/              # Static site files (HTML/CSS/images)
├── scripts/
│   ├── update-website.sh       # Deploy using aws s3 cp
│   └── update-website-sync.sh  # Deploy using aws s3 sync (optional challenge)
└── README.md
```

## Key commands used

```bash
# Create the bucket
aws s3api create-bucket --bucket <bucket-name> --region us-west-2 \
  --create-bucket-configuration LocationConstraint=us-west-2

# Enable static website hosting
aws s3 website s3://<bucket-name>/ --index-document index.html

# Deploy files
aws s3 cp ./website/ s3://<bucket-name>/ --recursive --acl public-read
```

## Result

A publicly accessible static website served directly from S3, with a script to push future updates.

## Notes

- `aws s3 sync` only uploads changed files, unlike `cp --recursive`, which re-uploads everything every time — much faster for iterative updates.
