# ServianTechChallenge



1.	Overview

This project is made as a requirement for Servian Technical Challenge. 
I have deployed the application using AWS cloud by creating infrastructure from scratch. For implementing IaC, my experience lies in creating cloudformation templates using python troposphere library for EKS Cluster (I can explain an alternative approach if requested) but for learning purposes I chose terraform for this project and used ECS to deploy container. For deployment of infrastructure, I created a Jenkins pipeline and separate Jenkins jobs for CI and CD.


2.	High level design diagram

![alt text](https://github.com/akshatarora02/ServianTechChallenge/blob/main/servian-challenge-akshat.jpg?raw=true)


This diagram shows a highly available infrastructure for the Servian app. Default VPC and public subnets were used for deployment of the app. The database instance was only launched in 1 AZ during implementation as it is enough for a small application but for high availability, this can be made multi-AZ.


3.	Deployment Procedure

Prerequisites:

•	Docker

•	Terraform

•	AWS CLI

•	Docker-compose


AWS Authentication:

Authentication of AWS account was done by exporting IAM User access key ID and secret access key. This can be done by running “aws configure” and entering the id and key. Default region was set to ap-southeast-2. 

S3 Bucket for backend initialisation:

A bucket created for backend initialisation, storing the .tfstate file.
After creating the bucket, enter the name of bucket in config.tf file in the “bucket” key section.

Export environment variables:

export TF_VAR_vpc_id=<value>
 
export TF_VAR_postgresql_password=<value>

Run Terraform:

make init

make plan

make apply

Run these commands one by one and note the alb_dns_name returned after last command. It can then be accessed by a browser. Finally, run the last command:

make update_db

this is a standalone script used to fill database with dummy data. This could also be deployed as a lambda script

To destroy the stack, run the following script:

make destroy

4.	Jenkins


I created a Jenkins server and installed aws, terraform, docker and docker-compose on it manually. This process can be automated by creating a user-data script.
Jenkinsfile placed in this repo is being used by the Jenkins pipeline to automate the above procedure. 

AWS Credentials were added using the cloudbees aws plugin and variables that were to be exported were added as environment variables.

The job log is present in this repository in the jenkinslog file.

Output after job run:

 ![alt text](https://github.com/akshatarora02/ServianTechChallenge/blob/main/output.png?raw=true)

After this, A CI job can be created which will build the app image and tag it and push it to a image repository like ECR/Dockerhub/JFrog. 

A separate CD job will then pull the image and deploy it on the ECS container.

We would then have latest changes available to us.

CI/CD jobs have not yet been implemented.

I have restricted the access to Jenkins server, hence, the log file. 


5.	Work that can be done additionally

•	Creating a CNAME and using it as a contact point instead of alb dns name. 
 
•	Adding ACM certificate for HTTPS support
 
•	Exclusive VPC for application
 
•	Jenkins CI/CD jobs
