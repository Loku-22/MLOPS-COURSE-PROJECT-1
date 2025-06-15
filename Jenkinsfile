pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
        GCP_PROJECT = "	sharp-quest-459013-d6"
        GCLOUD_PATH = "/var/jenkins_home/google-cloud-sdk/bin"
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

        stage ('Building and Pushing Docker images to GCR'){
            steps{
                withCredentials([file(credentialsId:'gcp-key',variable:"GOOGLE_APPLICATION_CREDIENTIALS")]){
                    echo 'Building and Pushing Docker images to GCR..........'
                    sh '''
                    export PATH = $PATH:${GCLOUD_PATH}
                    gcloud auth activate-service-account --key-file = $ {GOOGLE_APPLICATION_CREDIENTIALS}
                    gcloud config set project $ {GCP_PROJECT}
                    gcloud auth configure-docker --guite

                    docker build -t gcr.io/${GCP_PROJECT}/ml-project:latest .

                    docker push -t gcr.io/${GCP_PROJECT}/ml-project:latest 


                    '''
                }
            }
        }
 
    }
}