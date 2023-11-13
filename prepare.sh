#update the extension
az upgrade --yes


. ./env.sh

# create resource group and must in eastus
#az group create --location eastus --resource-group $rg --subscription $subscription 

#az containerapp env create --name $enviroment --resource-group $rg --subscription $subscription --location $location