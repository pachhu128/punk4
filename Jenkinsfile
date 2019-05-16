pipeline {
    agent any
    
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Create docker image') { 
            steps {
                sh 'sudo docker build . -t twitterfeed:1' 
            }
        }
    }
}
