module "aws-dev" {

  source       = "../../infra"
  instacia     = "t2.micro"
  regiao_aws   = "us-west-2"
  chave        = "iac-dev"
  name         = "Desenvolvimento"
  description  = "dev"
  acesso_geral = "dev"

}

output "IP-dev" {

  value = module.aws-dev.IP_pub

}
