#!groovy
pipeline {
    agent any 
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        timestamps()
    }

    stages {
        stage('Clone_repository') { 
            steps {
                git credentialsId: 'My_project', url: 'https://github.com/Demonmaycray/My_project'
            }
        }
        stage('deploy') {
            steps {
                sshagent(['Web-server']) {
                sh "scp -r -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/My_project_Pipeline/* ubuntu@18.222.249.167:/var/www/korchovyi_project"
                }
            echo "End of deploy"
            }
        }
    } 
}