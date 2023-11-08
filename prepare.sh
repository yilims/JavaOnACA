#update the extension
az extension remove -n containerapp
az extension add --source ./containerapp-0.3.43-py2.py3-none-any.whl


. ./env.sh

# create resource group and must in eastus
#az group create --location eastus --resource-group $rg --subscription $subscription 

#az containerapp env create --name $enviroment --resource-group $rg --subscription $subscription --location $location