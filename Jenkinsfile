pipeline {
    agent any

    parameters {
        string(name: 'ROLLBACK_VERSION', defaultValue: '', description: 'Build number to rollback')
    }

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
            when {
                expression { params.ROLLBACK_VERSION == '' }
            }
            steps {
                sh '''
                docker build -t $IMAGE_NAME:${env.BUILD_NUMBER} .
                '''
            }
        }
        stage('Deploy') {
            steps {
                script {
                    def version = params.ROLLBACK_VERSION ?: env.BUILD_NUMBER
                }
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d -p $PORT:80 --name $CONTAINER_NAME $imageTag
                '''
            }
        }
    }
}