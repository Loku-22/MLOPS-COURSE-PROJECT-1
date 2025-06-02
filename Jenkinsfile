pipeline{
    agent any

    stages {
        stage('Cloning GIthub repo Jkins'){
            steps{
                script{
                    echo 'Cloning Github repo to jenkins..........'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']])
                    

                }
            }
        }
    }
}