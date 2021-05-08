#!/bin/bash
export AWS_PAGER=""
source infra.env
terraform destroy
aws s3 rm s3://$TF_VAR_STATE_BUCKET_NAME --recursive
aws s3 rb s3://$TF_VAR_STATE_BUCKET_NAME
rm -rf infra.env
