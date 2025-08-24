# Deploying a Spring Boot App on AWS EC2 instance using Terraform, Ansible and Docker

## Summary
This project containerizes a simple Java Spring Boot application and deploys it on an AWS EC2 instance using a prominent DevOps practice, Infrastructure as Code (IaC)

## Project Architecture
- **Spring Boot App:** a simple Java application written in Spring Boot web framework
- **Terraform:** Provisions the AWS EC2 instance and attaches a security group that allows SSH and HTTP requests to enter the server
- **Ansible:** Configures the EC2 instance by installing and starting Docker, builds docker image and finally deploys the app (runs the docker container)
- **Dockerfile:** Builds the maven JAR file inside the image and then deploys the app on port 8080

## How To Run This Project

### Prerequisites:
Have AWS CLI, Terraform and Ansible installed on your local machine

### 1. Clone the Repository
```
git clone git@github.com:AfsahSiddiqui/Docker-AWS-EC2-Ansible-Terraform.git
cd Docker-AWS-EC2-Ansible-Terraform
```

### 2. Configure AWS Credentials
Note: make sure your IAM user has required permissions to launch an EC2 instance and create security group
```
aws configure
```

### 3. Launch AWS EC2 Instance via Terraform
Edit the main.tf file to use the existing key pair (or create one if you don't have it already
```
cd terraform
terraform init
terraform apply
```

### 4. Configure the EC2 instance and Deploy the App
Edit the hosts.ini file to use the Public IP address of the EC2 instance launched via terraform, and give path to the .pem file (downloaded when key pair was created0
```
cd ../ansible
ansible-playbook -i hosts.ini playbook.yml
```

***Following these steps, you will successfully deploy the web app on AWS EC2 instance.***

### Cleanup:
- Terminate the EC2 instance and delete associated security group by running:
  ```
  terraform destroy
  ```
