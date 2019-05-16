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
                sh 'docker build --build-arg USER=aditya93 --build-arg PASSWORD=Gangstre10893 -f Dockerfile -t twitterfeed:1 .' 
            }
        }
    }
}
