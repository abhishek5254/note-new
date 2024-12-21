pipeline {
  agent { label 'jenkins-Agent' }
  tools {
    jdk 'Java17'
    maven 'Maven3'
  }
  stages{
    stage("Cleanup Workspace"){
                steps {
                cleanWs()
                }
        }

        stage("Checkout from SCM"){
                steps {
                    git branch: 'master', credentialsId: 'github', url: 'https://github.com/abhishek5254/note-new.git'
                }
        }
    stage("Build Application"){
            steps {
                sh "mvn clean package"
            }
       }
    stage("Test Application"){
           steps {
                 sh "mvn test"
           }
       }
    

  }
}
