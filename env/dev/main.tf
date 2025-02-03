module "aws-dev" {

  source       = "../../infra"
  instacia     = "t2.micro"
  regiao_aws   = "us-west-2"
  chave        = "iac-dev"
  name         = "Desenvolvimento"
  description  = "dev"
  acesso_geral = "dev"
  grupoSegunca = "Dev"
  nameGrupo = "Dev"
  maximo = 1
  minimo =  0


}