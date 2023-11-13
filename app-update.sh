
. ./env.sh

jarpath=./sample/jar
jarapp=spring-jar
sourcepath=./sample/source/spring-petclinic
sourceapp=spring-source
repoapp=spring-repo-with-registry
repoappnoreg=spring-repo-no-registry

echo 'Deploy Jar built with JDK 21'
az containerapp update -n $jarapp -g $rg  --artifact $jarpath/spring-petclinic-jdk-21-3.1.0-SNAPSHOT.jar --subscription $subscription 

echo 'Deploy Jar built with JDK 17'
az containerapp update -n $jarapp -g $rg  --artifact $jarpath/spring-petclinic-jdk-17-3.1.0-SNAPSHOT.jar --subscription $subscription 

echo 'Deploy Jar built with JDK 11'
az containerapp update -n $jarapp -g $rg  --artifact $jarpath/demo-jdk-11-0.0.1-SNAPSHOT.jar --subscription $subscription 

echo 'Deploy Jar built with JDK 8'
az containerapp update -n $jarapp -g $rg  --artifact $jarpath/demo-jdk-8-0.0.1-SNAPSHOT.jar --subscription $subscription 

echo 'Deploy source code'
az containerapp update -n $sourceapp -g $rg  --source $sourcepath --subscription $subscription 

echo 'Deploy source code with local builder, please start docker engine first'
az containerapp update -n "${sourceapp}-local" -g $rg  --source $sourcepath --subscription $subscription --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass

echo 'Deploy source code from git repo with container registery'
az containerapp update -n "${repoapp}" -g $rg  --repo $repourl --subscription $subscription --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass