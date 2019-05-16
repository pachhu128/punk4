pipeline {
    agent any
    
    stages {
        stage('Build') { 
            steps {
                sh 'mvn clean package' 
            }
        }
        stage('Create docker image') { 
            steps {
                sh 'docker build -f Dockerfile -t twitterfeed:1 .' 
            }
        }
    }
}
