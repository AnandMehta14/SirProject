pipeline {

   agent any
   
   tools {
      maven 'maven'
   }
  
  stages {
      
    stage('Git Clone') {
      steps {
        git 'https://github.com/AnandMehta14/SirProject.git'
      }
    }
     
    stage('Build') {
      steps {
        sh 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    } 
  
    stage('Msg') {
      steps {
        echo "Build_number:$BUILD_NUMBER"
      }
    }
     
    stage('Docker Image') {
      steps {
        sh label: '', script: '''docker build -t java-image1:$BUILD_NUMBER .
                                 docker tag java-image1:$BUILD_NUMBER mehta14/java-image1:$BUILD_NUMBER'''                               
                               
      }
    } 
     
    stage('Pushing Image to DockerHub') {
      steps {
        sh label: '', script: '''docker push mehta14/java-image1:$BUILD_NUMBER''' 
      }
    } 
    
    stage('Deployment of Image in Production Server') {
      steps {
        sh label: '', script: '''ssh jenkins@172.31.33.200 docker pull mehta14/java-image1:$BUILD_NUMBER
                                 ssh jenkins@172.31.33.200 docker rm -f my_project1 || true
                                 ssh jenkins@172.31.33.200 docker run -dit -p 8111:8080 --name my_project1 mehta14/java-image1:$BUILD_NUMBER''' 
      }
    }  
    
    
  }
  
}
