pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="ap-southeast-2"
        AWS_CREDS=credentials('AWS_CREDS')
    }
    stages {
        stage('Init') {
            steps {
                sh '''   
                        make init
                    '''
            }
        }
        stage('Plan') {
            steps {
                sh 'make plan'
            }
        }
        stage('Apply') {
            steps {
                sh 'make apply'
            }
        }
        stage('UpdateDB') {
            steps {
                sh 'make update_db'
            }
        }
    }
}

