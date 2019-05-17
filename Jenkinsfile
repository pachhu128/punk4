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
                script {
                  def scmVars = checkout([
                    $class: 'GitSCM',
                    doGenerateSubmoduleConfigurations: false,
                    userRemoteConfigs: [[
                        url: 'https://github.com/AdityaVishwekar/twitter-feed.git'
                      ]],
                    branches: [ [name: '*/master'] ]
                  ])
                sh "docker build -f Dockerfile -t twitterfeed:${scmVars.GIT_COMMIT} ." 
                }
            }
        }
        stage('Push image to OCIR') { 
            steps {
               script {
                  def scmVars = checkout([
                    $class: 'GitSCM',
                    doGenerateSubmoduleConfigurations: false,
                    userRemoteConfigs: [[
                        url: 'https://github.com/AdityaVishwekar/twitter-feed.git'
                      ]],
                    branches: [ [name: '*/master'] ]
                  ])
                sh "docker login -u cloud_pursuit_west/aditya.vishwekar@oracle.com -p I1mk-n7tMXW#ZWv8xkmP iad.ocir.io"
                sh "docker tag twitterfeed:${scmVars.GIT_COMMIT} iad.ocir.io/cloud_pursuit_west/twitterfeed"
                sh "docker push iad.ocir.io/cloud_pursuit_west/twitterfeed"
            
               }
            }
        }
    }
}
