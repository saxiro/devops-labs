#!/bin/bash
# iac-deploy.sh <region> [apply | destroy]


args=($*)
region=${args[0]}
action=${args[1]}

export TF_VAR_aws_region=${region}

export TERRAFORM_CMD="./terraform ${action} -state=regions/${region}/terraform.tfstate -auto-approve"
eval $TERRAFORM_CMD