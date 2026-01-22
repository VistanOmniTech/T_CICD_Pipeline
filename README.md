#use this commands when we create a EC2 instance fill the userdata filed 
#!/bin/bash
sudo apt update -y
sudo apt install ruby wget -y
cd /home/ubuntu
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x install
sudo ./install auto
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent


Add a in your github repository ---> settings ---> secrets & variables ---> actions add a

1.Name : AWS_ACCESS_KEY_ID secret : 
2.Name : AWS_REGION secret :
3.Name : AWS_SECRET_ACCESS_KEY secret :


#------------------deploy.yml file--------------------------- 

name: Django CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Zip project
        run: zip -r deploy.zip .

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ secrets.AWS_REGION }}

      - name: Upload to S3
        run: |
          aws s3 cp deploy.zip s3://myproject-cicd-artifacts/deploy.zip

      - name: Deploy via CodeDeploy
        run: |
          aws deploy create-deployment \
            --application-name myproject-codedeploy-app \
            --deployment-group-name myproject-deployment-group \
            --s3-location bucket=myproject-cicd-artifacts,key=deploy.zip,bundleType=zip




create a iam user for below policys 

1.AmazonS3FullAccess

2.AWSCodeDeployFullAccess