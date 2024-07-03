module "aws-dev" {

  source     = "../../infra"
  instacia   = "t2.micro"
  regiao_aws = "us-west-2"
  chave      = "iac-dev"

}
