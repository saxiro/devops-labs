#!/bin/bash
# iac-deploy.sh <region> [apply | destroy]


args=($*)
region=${args[0]}
action=${args[1]}

export TF_VAR_aws_region=${region}
export TF_VAR_aws_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}

export TERRAFORM_CMD="./terraform ${action} -state=regions/${region}/terraform.tfstate -auto-approve"
eval $TERRAFORM_CMD