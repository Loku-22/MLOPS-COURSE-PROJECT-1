pipeline {
    agent {
        docker {
            image 'python:3.10-slim'  // ✅ Uses Python pre-installed image
        }
    }

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Cloning Repo') {
            steps {
                echo 'Cloning Github repo to jenkins..........'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']]) 

            }
        }

        stage('Setting up Virtual Environment and Installing Dependencies') {
            steps {
                script {
                    echo 'Setting up virtual environment and installing dependencies'
                    sh '''
                        python -m venv $VENV_DIR
                        . $VENV_DIR/bin/activate
                        pip install --upgrade pip
                        pip install -e .
                    '''
                }
            }
        }
    }
}

