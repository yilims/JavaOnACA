
. ./env.sh

jarpath=./sample/jar/spring-petclinic-3.1.0-SNAPSHOT.jar
jarapp=spring-jar-17
sourcepath=./sample/source/spring-petclinic
sourceapp=spring-source-17
repoapp=spring-repo-17-with-registry
repoappnoreg=spring-repo-17-no-registry
echo 'Deploy source code with local builder, please start docker engine first.'
az containerapp up -n "${sourceapp}-local" -g $rg  --environment $enviroment --artifact $jarpath --ingress external --target-port 8080 --subscription $subscription --location $location --registry-server $registryserver --registry-user $registryuser --registry-pass $registerpass