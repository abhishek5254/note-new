pipeline {
    agent any // Or specify a particular agent if required
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        IMAGE_NAME = "abhishek7380/note-taker-webapp"
    }
   
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/abhishek5254/Note.git'
            }
        }
        stage('Build Java Application') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}", "-f Dockerfile .")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Clean workspace
        }
    }
}
