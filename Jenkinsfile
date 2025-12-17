pipeline {
    agent any

    environment {
        IMAGE_NAME = 'html-cicd-demo'
        TAG = "${BUILD_NUMBER}"
        ACTIVE_COLOR_FILE = ".active_color"
        CONTAINER_NAME = 'html-cicd-demo'
        PORT = '8085'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vigneshsivasubramaniyan/cicd_jenkins_to_docker.git'
            }
        }
        stage('Detect active color') {
            steps {
                sh '''
                if [! -f $ACTIVE_COLOR_FILE ]; then
                    echo "blue" > $ACTIVE_COLOR_FILE
                fi
                '''
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }
        stage('Deploy Inactive Color') {
            steps {
                sh '''
                    ACTIVE_COLOR=$(cat $ACTIVE_COLOR_FILE)
                    if [ "$ACTIVE_COLOR" = "blue" ]; then
                        INACTIVE_COLOR="green"
                    else
                        INACTIVE_COLOR="blue"
                    fi

                    export TAG=$TAG
                    docker compose up -d web-$TARGET
                    '''
            }
        }
        stage('Switch Traffic') {
            steps {
                sh '''
                    ACTIVE_COLOR=$(cat $ACTIVE_COLOR_FILE)
                    if [ "$ACTIVE_COLOR" = "blue" ]; then
                        echo "green" > $ACTIVE_COLOR_FILE
                    else
                        echo "blue" > $ACTIVE_COLOR_FILE
                    fi
                    '''
            }
        }
    }
}