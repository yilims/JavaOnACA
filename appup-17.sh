
. ./env.sh

jarpath=./sample/jar/spring-petclinic-3.1.0-SNAPSHOT.jar
jarapp=spring-jar-17
sourcepath=./sample/source/spring-petclinic
sourceapp=spring-source-17
sourcepathall=./sample/source/spring-petclinic-all
sourceappall=spring-source-all-17

#az containerapp up -n $sourceappall -g $rg  --environment $enviroment --source $sourcepathall --ingress external --target-port 8080 --subscription $subscription --location $location 
echo 'Deploy with Jar'
az containerapp delete -n $jarapp -g $rg --subscription $subscription
az containerapp up -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath --ingress external --target-port 8080 --subscription $subscription --location $location 

echo 'Deploy with source code'
az containerapp delete -n $sourceapp -g $rg --subscription $subscription
az containerapp up -n $sourceapp -g $rg  --environment $enviroment --source $sourcepath --ingress external --target-port 8080 --subscription $subscription --location $location 

echo 'Deploy with source code and all'
az containerapp delete -n $sourceappall -g $rg --subscription $subscription
az containerapp up -n $sourceappall -g $rg  --environment $enviroment --source $sourcepathall --ingress external --target-port 8080 --subscription $subscription --location $location
