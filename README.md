# Docker AWS CLI
Docker image containing AWS cli, AWS EB cli and S3cmd

## What are included
1. Alpine 3.12 base image
1. Python 3(.8.5)
1. [AWS CLI v1](https://docs.aws.amazon.com/cli/latest/reference/)
1. [AWS Elastic Beanstalk CLI v3](https://docs.aws.amazon.com/cli/latest/reference/)
1. [S3cmd](https://github.com/s3tools/s3cmd)

## Build
```shell script
docker build -t p0vidl0/aws-cli .
```
[![DockerHub Badge](http://dockeri.co/image/p0vidl0/aws-cli)](https://hub.docker.com/r/p0vidl0/aws-cli/)

## Configuration
There are three ways to configure AWS credentials for the container on this image.

### Host environment variables

```shell script
# Configure variables
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"

# Run container
docker run --rm -it \
	-e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
	-e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
	-e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
	-v "$(pwd):/project" \
	p0vidl0/aws-cli
```

### Container environment variables
```shell script
# Configure variables
echo "AWS_ACCESS_KEY_ID=<id>" >> '.env' 
echo "AWS_SECRET_ACCESS_KEY=<key>" >> '.env' 
echo "AWS_DEFAULT_REGION=<region>" >> '.env' 

# Run container
docker run --rm -it \
	--env-file .env \
	-v "$(pwd):/project" \
	p0vidl0/aws-cli
```

### AWS config for container
```shell script
# Run container
docker run --rm -it \
	--env-file .env \
	-v "~/.aws:/root/.aws" \
	-v "$(pwd):/project" \
	p0vidl0/aws-cli
```
