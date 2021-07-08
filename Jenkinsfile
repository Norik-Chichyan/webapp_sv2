pipeline {
    agent any
    stages {
        stage('Terraform init') {
            environment {
            AWS_ACCESS_KEYS = credentials('aws_cred')
            }
            steps {
                sh 'terraform init'   
            }        
        }
        stage('Terraform apply') {
            environment {
            AWS_ACCESS_KEYS = credentials('aws_cred')
            }
             steps {
                sh 'terraform apply --auto-approve'   
            }        
        }
        stage('run ansiblefor sv2') {
            steps {
                ansiblePlaybook credentialsId: 'aws-cred-priv', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inv_sv2_aws_ec2.yml', playbook: 'sv2.yml''   
            }        
        }
    }
}
