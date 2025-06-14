pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }



    stages{
        stage ('Cloning github repo to genkins'){
            steps{
                script{
                    echo 'Cloning github rpo to genkins.....'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github_First', url: 'https://github.com/Loku-22/MLOPS-COURSE-PROJECT-1.git']])


                }
            }
        }

        stage ('seting up our virtual env and install dependencies'){
            steps{
                script{
                    echo 'seting up our virtual env and install dependencies'
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