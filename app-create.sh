
. ./env.sh

jarpath=./sample/jar
jarapp=spring-jar
sourcepath=./sample/source/spring-petclinic
sourceapp=spring-source
repoapp=spring-repo-with-registry
repoappnoreg=spring-repo-no-registry

echo 'Deploy Jar built with JDK 21'
az containerapp create -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath/spring-petclinic-jdk-21-3.1.0-SNAPSHOT.jar --ingress external --target-port 8080 --subscription $subscription  

echo 'Deploy Jar built with JDK 17'
az containerapp create -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath/spring-petclinic-jdk-17-3.1.0-SNAPSHOT.jar --ingress external --target-port 8080 --subscription $subscription  

echo 'Deploy Jar built with JDK 11'
az containerapp create -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath/demo-jdk-11-0.0.1-SNAPSHOT.jar --ingress external --target-port 8080 --subscription $subscription  

echo 'Deploy Jar built with JDK 8'
az containerapp create -n $jarapp -g $rg  --environment $enviroment --artifact $jarpath/demo-jdk-8-0.0.1-SNAPSHOT.jar --ingress external --target-port 8080 --subscription $subscription  

echo 'Deploy source code'
az containerapp create -n $sourceapp -g $rg  --environment $enviroment --source $sourcepath --ingress external --target-port 8080 --subscription $subscription  

echo 'Deploy source code with local builder, please start docker engine first'
az containerapp create -n "${sourceapp}-local" -g $rg  --environment $enviroment --source $sourcepath --ingress external --target-port 8080 --subscription $subscription  --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass

echo 'Deploy source code from git repo with container registery'
az containerapp create -n "${repoapp}" -g $rg  --environment $enviroment --repo $repourl --ingress external --target-port 8080 --subscription $subscription  --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass