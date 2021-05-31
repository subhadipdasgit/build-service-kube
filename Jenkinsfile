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
            sh 'docker tag apache2.0exam subhadipdocker/exam:apacheexam4'
            sh 'docker push subhadipdocker/exam:apacheexam4'
            }
       }
   
   stage('Apply Kubernetes Files') {
       steps {
          withKubeConfig([credentialsId: 'kube-config']) {
          sh 'cat deployment.yml | sed "s/{{BUILD_NUMBER}}/$BUILD_NUMBER/g" | kubectl apply -f -'
         }
      }
    }
  }
}  
