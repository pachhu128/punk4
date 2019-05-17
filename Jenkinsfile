pipeline {
    agent any
    
    stages {
        
        stage('Build') { 
            steps {
                sh "mvn install -DskipTests" 
            }
        }
        stage('Create docker image') { 
            steps {
                env.GIT_COMMIT = scmVars.GIT_COMMIT
                sh "docker build -f Dockerfile -t twitterfeed:${env.GIT_COMMIT} ." 
            }
        }
        stage('Push image to OCIR') { 
            steps {
                sh "docker login -u cloud_pursuit_west/aditya.vishwekar@oracle.com -p I1mk-n7tMXW#ZWv8xkmP iad.ocir.io"
                sh "docker tag twitterfeed:1 iad.ocir.io/cloud_pursuit_west/twitterfeed"
                sh "docker push iad.ocir.io/cloud_pursuit_west/twitterfeed"
            }
        }
    }
}
