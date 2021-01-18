pipeline {
    agent {
        label 'slave-app'
    }
    
    tools {
        maven 'maven3'
    }

    
    stages{
        stage('SCM'){
            steps{
                git branch: 'main', credentialsId: 'gitHub', 
                    url: 'https://github.com/m-marinka/DevOps-Final-Project'
            }        
        }
        
        stage('Maven Build'){
            steps{
                sh "ls -lah"
                sh "mvn clean"
                sh "mvn package"
            }
        }
        
        stage('Docker Build'){
            steps{
                sh "docker build . -f Dockerfile -t mmarinka/docker-spring-boot "
                sh "docker images"
            }
        }
        
        stage('Docker Push'){
            steps{
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerHubPass')]) {
                    sh "docker login -u mmarinka -p ${dockerHubPass}"    
    // some block
    
            }
                sh "docker push mmarinka/docker-spring-boot:latest "
            }
        }
        
                stage('Docker Deploy'){
            steps{
                ansiblePlaybook become: true, becomeUser: 'devuser', credentialsId: 'run_ansible_plaubook', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
                sh "sudo reboot"
            }
                    
        }
    }
        
}
