module "aws-prod" {

  source     = "../../infra"
  instacia   = "t2.micro"
  regiao_aws = "us-west-2"
  chave      = "iac-prod"
  name = "producao"
  description = "prod"
  acesso_geral = "prod"
  grupoSegunca = "producao"
  nameGrupo = "Prod"
  maximo = 10
  minimo =  1

}