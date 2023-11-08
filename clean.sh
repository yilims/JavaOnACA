
. ./env.sh

# create resource group and must in eastus

az containerapp env delete --name $enviroment --resource-group $rg --subscription $subscription
az group delete --resource-group $rg --subscription $subscription 
