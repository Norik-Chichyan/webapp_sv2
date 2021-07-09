pipeline {
    agent master
    stages {
       stage('run ansiblefor sv2') {
            steps {
                ansiblePlaybook credentialsId: 'aws-cred-priv', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inv_sv2_aws_ec2.yml', playbook: 'sv2.yml'   
            }        
        }
    }
}
