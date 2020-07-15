pipeline {

   agent any
  
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
                                 docker tag java-image:$BUILD_NUMBER mehta14/java-image1:$BUILD_NUMBER'''                               
                               
      }
    } 
     
    stage('Pushing Image to DockerHub') {
      steps {
        sh label: '', script: ''' docker push mehta14/jjava-image1:$BUILD_NUMBER''' 
      }
    } 
    
  
  }
  
}
