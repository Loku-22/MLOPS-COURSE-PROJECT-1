pipeline {
    agent any

    stages{
        stage ('Cloning github repo to genkins'){
            steps{
                script{
                    echo 'Cloning github rpo to genkins.....'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github_First', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']])
                    

                }
            }
        }
    }
}