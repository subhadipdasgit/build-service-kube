pipeline {
   agent any
stages {
   
   stage('image check'){
        steps{
                sh 'docker images'
             }
        }
   stage('image build'){
        steps{
                sh 'docker build -t apache2.0exam .'
                sh 'docker images'
             
             }
        }
   stage('dockerhub login'){
        steps{
           withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'password', usernameVariable: 'usetrname')]) {
                sh 'docker login -u $usetrname -p $password'
             }
        }
   }
   stage('image push'){
       steps{ 
            sh 'docker tag apache2.0exam subhadipdocker/exam:apacheexam3'
            sh 'docker push subhadipdocker/exam:apacheexam3'
            }
       }
   } 
}
