terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = var.instacia
  key_name      = var.chave

  tags = {
    Name = "Aws-prod"
  }
}


resource "aws_key_pair" "chaveSSH" {

  key_name   = var.chave
  public_key = file("${var.chave}.pub")

}