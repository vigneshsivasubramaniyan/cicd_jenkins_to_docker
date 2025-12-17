pipeline {
    agent any

    environment {
        APP_NAME = "html-cicd-demo"
        PORT = "8085"
    }

    stages {
        stage('Build Image') {
            steps {
                sh '''
                #!/bin/bash
                set -e
                docker build -t ${APP_NAME}:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                #!/bin/bash
                set -e
                docker stop ${APP_NAME} || true
                docker rm ${APP_NAME} || true

                docker run -d \
                  --name ${APP_NAME} \
                  -p ${PORT}:80 \
                  ${APP_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }
}
