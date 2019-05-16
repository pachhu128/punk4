pipeline {
    agent any
    
    stages {
        stage('Build') { 
            steps {
                sh 'mvn install -DskipTests' 
            }
        }
        stage('Create docker image') { 
            steps {
                sh 'docker build -f Dockerfile -t twitterfeed:1 .' 
            }
        }
    }
}
