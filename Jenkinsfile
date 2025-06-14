pipeline{
    agent any

    stages {
        stage ("Cloning Github repo to jenkins"){
            steps{
                script{
                    echo "cloning Github repo to Jenkins........."
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']]) 

                }
            }
        }
    }
}

