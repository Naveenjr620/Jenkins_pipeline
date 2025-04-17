pipeline {
    agent any
 
    environment {
        DOCKER_IMAGE = 'hotelreservation'
        CONTAINER_NAME = 'reservation-app'
        PORT = '5000'
    }
 
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Naveenjr620/Jenkins_pipeline.git'
            }
        }
 
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
 
        stage('Test Build') {
            steps {
                echo "✅ Docker image built successfully. You can add test steps here later."
            }
        }
 
        stage('Deploy to Production') {
            steps {
                // Stop existing container if running
                sh '''
                    docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p $PORT:5000 $DOCKER_IMAGE
                '''
                echo "🚀 Deployed to production successfully"
            }
        }
    }
 
    post {
        failure {
            echo "❌ Build or deploy failed!"
        }
    }
}