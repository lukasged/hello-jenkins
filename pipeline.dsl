node('docker') {
   stage 'Clone Git repo'
    git branch: 'master', credentialsId: '413392fd-d86e-4ed1-9a7f-3c2079c6c663', url: 'git@github.com:lukasged/hello-jenkins.git'
    
   stage 'Build Docker image'
    sh 'docker build --pull=true -t lukasged/jenkinsdockertest:latest .'
    
   stage 'Run tests'
    sh 'docker run -i --rm lukasged/jenkinsdockertest:latest ./script/test'
}
