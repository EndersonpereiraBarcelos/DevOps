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
resource "aws_launch_template" "maquina" {
  image_id      = "ami-0cf2b4e024cdb6960"
  instance_type = var.instacia
  key_name      = var.chave

  tags = {
    Name = var.name
  }
  security_group_names = [var.grupoSegunca]
  user_data = filebase64('ansible.sh')
}

resource "aws_key_pair" "chaveSSH" {

  key_name   = var.chave
  public_key = file("${var.chave}.pub")

}

resource "aws_autoscaling_group" "instancia_com_template" {
  availability_zones = ["${var.regiao_aws}a", "${var.regiao_aws}b"]
  name     = var.nameGrupo
  max_size = var.maximo
  min_size = var.minimo

  launch_template {
    id      = aws_launch_template.maquina.id
    version = "$Latest"
  }
}
resource "aws_defautl_subnet" "subnet1" {

  availability_zones  = "${var.regiao_aws}a"
  
}

resource "aws_defautl_subnet" "subnet2" {

  availability_zones  = "${var.regiao_aws}b"
  
}
