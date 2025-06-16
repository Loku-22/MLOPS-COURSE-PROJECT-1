pipeline {
    agent any 

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage ('Cloning Github repo of jenkins'){
            steps {
                script{
                    echo 'Cloning Github repo to jenkins.....'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-tokens', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']])
                }
            }
        }

        stage ('Setting up virtual env and installing dependencies'){
            steps {
                script{
                    echo 'Setting up virtual env and installing dependencies......'
                    sh '''
                    python -m venv ${VENV_DIR}
                    . $ {VENV_DIR}/bin/activate
                    pip install --upgrade pip
                    pip install -e .
                    '''
                }
            }
        }
    }
}