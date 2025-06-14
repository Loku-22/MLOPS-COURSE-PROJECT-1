pipeline{
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Cloning GIthub repo Jkins'){
            steps{
                script{
                    echo 'Cloning Github repo to jenkins..........'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']]) 
                     
                }
            }
        }

        stage('Setting up our Virtual Environment and installing dependencies'){
            steps{
                script{
                    echo 'Setting up our Virtual Environment and installing dependencies'
                    sh '''
                    apt-get update
                    apt-get install -y python3 python3-venv python3-pip
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -e .
                '''
                }
            }
        }
    }
}