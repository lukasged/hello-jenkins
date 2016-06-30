node('docker') {
   stage 'Build Docker image'
    sh 'docker build --pull=true -t lukasged/jenkinsdockertest:latest .'
    
   stage 'Run tests'
    sh 'docker run -i --rm lukasged/jenkinsdockertest:latest ./script/test'
}
