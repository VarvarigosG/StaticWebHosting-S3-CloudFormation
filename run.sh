#!/bin/bash
echo "This script creates an AWS CloudFormation Stack that spawns a AWS S3 bucket that hosts a static website"
read -p "Enter the AWS CloudFormation Stack Name:" CloudFormationStackName
read -p "Enter the AWS CloudFormation Stack Region:" StackRegion
read -p "Specify the directory that the yaml file is currently in (ex file://example.yaml):" YAMLCurrDirectory
read -p "Enter the AWS S3 BucketName (must be globally unique):" S3BucketName
read -p "Enter the AWS S3 Index Document:" S3IndexDocument
read -p "Enter the AWS S3 Error Document:" S3ErrorDocument
# read -p "Enter the directory path that contains the website file (ex '/mnt/c/Niaros House Project/'):" WebFilesDirectoryPath
aws cloudformation create-stack --stack-name ${CloudFormationStackName} --template-body  ${YAMLCurrDirectory} --region ${StackRegion} --parameters ParameterKey=BucketName,ParameterValue=${S3BucketName} ParameterKey=IndexDocument,ParameterValue=${S3IndexDocument} ParameterKey=ErrorDocument,ParameterValue=${S3ErrorDocument}
aws s3 sync . s3://${S3BucketName}/ --exclude ".git/*"  --exclude "css/*" --exclude "dist/*" --exclude "fonts/*" --exclude "js/*" --exclude "*.yaml" --exclude "*.sh"
# xdg-open http://${BucketName}.s3-website-${StackRegion}.amazonaws.com/#
echo "Open this URL:" http://${S3BucketName}.s3-website-${StackRegion}.amazonaws.com/#
