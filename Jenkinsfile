pipeline{
    agent any

    environment {
        VENV_DIR = "venv"
    }


    stages {
        stage ("Cloning Github repo to jenkins"){
            steps{
                script{
                    echo "cloning Github repo to Jenkins........."
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']]) 

                }
            }
        }

        stage ("Setting up our virtual Environmental and insalling dependencies."){
            steps{
                script{
                    echo "Setting up our virtual Environmental and insalling dependencies."
                    sh '''
                    python -m venv ${VENV_DIR}
                    . ${VENV_DIR}/bin/activate
                    pip install --upgrade pip 
                    pip install -e .
                    '''
                }
            }
        }
    }
}

