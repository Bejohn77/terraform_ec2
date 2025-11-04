#!/bin/bash

stage('Push to DockerHub') {

steps {

echo "This is pushing the code to DockerHub"

withCredentials([usernamePassword(credentialsId: 'dockerHubCred', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPass')]) {

sh "docker login -u ${dockerHubUser} -p ${dockerHubPass}”

sh “docker image tag notes-app:latest ${dockerHubUser}/notes-app:latest”

sh “docker push ${dockerHubUser}/notes-app:latest "

}
}

