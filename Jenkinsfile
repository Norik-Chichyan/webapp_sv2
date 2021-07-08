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
        stage('ansible run on sv2') {
            environment {
            AWS_ACCESS_KEYS = credentials('aws_cred')
            }
             steps {
                ansiblePlaybook credentialsId: 'aws-cred-priv', installation: 'Ansible', inventory: '/webapp-sv2/inv_sv2_aws_ec2.yml', playbook: '/webapp-sv2/sv2.yml'   
            }        
        }
    }
}
