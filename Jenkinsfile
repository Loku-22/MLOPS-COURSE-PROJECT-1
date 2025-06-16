pipeline {
    agent any 

    stages {
        stage ('Cloning Github repo of jenkins'){
            steps {
                script{
                    echo 'Cloning Github repo to jenkins.....'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-tokens', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']])
                }
            }
        }
    }
}