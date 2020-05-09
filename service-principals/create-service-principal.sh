#!/bin/bash

# this script allows the creation of service principal with an acrpull role
# in order to be able to retrieve (pull) images from an ACR 
# it's almost the same with the sample script in
# https://github.com/Azure-Samples/azure-cli-samples/blob/master/container-registry/service-principal-create/service-principal-create.sh

# USAGE: create-service-principal.sh <ACR_NAME> <SERVICE_PRINCIPAL_NAME>
ACR_NAME=$1
SERVICE_PRINCIPAL_NAME=$2

# obtain the full registry ID for subsequent command args
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

SP_PASSWD=$()
# You can use the app id  generated below in the azure portal (enterprise applications)
# to find the SP you created
SP_APP_ID=$(az ad sp show --id http://$SERVICE_PRINCIPAL_NAME --query appId --output tsv)

# Output the credentials created
# These can be used by applications to authenticate with a pull permission agains
# The azure container registry
# You can also store these credentials to an Azure Key vault
echo "Service principal ID: $SP_APP_ID"
echo "Service principal password: $SP_PASSWD"

