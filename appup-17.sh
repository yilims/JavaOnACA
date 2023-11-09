
. ./env.sh

jarpath=./sample/jar/spring-petclinic-3.1.0-SNAPSHOT.jar
jarapp=spring-jar-17
sourcepath=./sample/source/spring-petclinic
sourceapp=spring-source-17
sourcepathall=./sample/source/spring-petclinic-all
sourceappall=spring-source-all-17
repoapp=spring-repo-17
repoappnoreg=spring-repo-17-no-registry

echo 'Deploy Jar'
az containerapp delete -n $jarapp -g $rg --subscription $subscription --yes
az containerapp up -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath --ingress external --target-port 8080 --subscription $subscription --location $location 

echo 'Deploy source code'
az containerapp delete -n $sourceapp -g $rg --subscription $subscription --yes
az containerapp up -n $sourceapp -g $rg  --environment $enviroment --source $sourcepath --ingress external --target-port 8080 --subscription $subscription --location $location 

echo 'Deploy source code with mvn and github related files'
az containerapp delete -n $sourceappall -g $rg --subscription $subscription --yes
az containerapp up -n $sourceappall -g $rg  --environment $enviroment --source $sourcepathall --ingress external --target-port 8080 --subscription $subscription --location $location

echo 'Build source code with local builder and deploy, need to start Docker Engine first'
az containerapp delete -n "${sourceapp}-local" -g $rg --subscription $subscription --yes
az containerapp up -n "${sourceapp}-local" -g $rg  --environment $enviroment --source $sourcepath --ingress external --target-port 8080 --subscription $subscription --location $location --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass

echo 'Deploy source code from git repo'
az containerapp delete -n "${repoapp}" -g $rg --subscription $subscription --yes
az containerapp up -n "${repoapp}" -g $rg  --environment $enviroment --repo $repourl --ingress external --target-port 8080 --subscription $subscription --location $location --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass

# echo 'Deploy with source code from repo without registery'
# az containerapp delete -n "${repoappnoreg}" -g $rg --subscription $subscription --yes
# az containerapp up -n "${repoappnoreg}" -g $rg  --environment $enviroment --repo $repourl --ingress external --target-port 8080 --subscription $subscription --location $location 
