pipeline {
    agent any

    environment {
        IMAGE_NAME = 'html-cicd-demo'
        CONTAINER_NAME = 'html-cicd-demo'
        PORT = '8085'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vigneshsivasubramaniyan/cicd_jenkins_to_docker.git'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME:latest
                '''
            }
        }
    }
}