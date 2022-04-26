provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_s3_bucket" "bookbuckettf" {
  bucket = "bookbucket1994tf"
  acl = "private"
}

resource "aws_s3_bucket_object" "aws_bookbuckettf" {
  bucket = aws_s3_bucket.bookbuckettf.id
  key = "beanstalk/bookstoretf"
  source = "target/bookstore-0.0.1-SNAPSHOT.jar"
}

resource "aws_elastic_beanstalk_application" "beanstalk_myapp" {
  name = "bookstoretf"
  description = "The description of my application"
}

resource "aws_elastic_beanstalk_application_version" "beanstalk_myapp_version" {
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  bucket = aws_s3_bucket.bookbuckettf.id
  key = aws_s3_bucket_object.aws_bookbuckettf.id
  name = "myapp-1.0.0"
}

resource "aws_elastic_beanstalk_environment" "beanstalk_myapp_env" {
  name = "bookstoretf-dev"
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.13 running Corretto 11"
  version_label = aws_elastic_beanstalk_application_version.beanstalk_myapp_version.name

  setting {
    name = "SERVER_PORT"
    namespace = "aws:elasticbeanstalk:application:environment"
    value = "5000"
  }

  setting {
    namespace = "aws:ec2:instances"
    name = "InstanceTypes"
    value = "t2.micro"
  }

  setting {
   namespace = "aws:autoscaling:launchconfiguration"
   name = "IamInstanceProfile"
   value = "aws-elasticbeanstalk-ec2-role"
  }
}