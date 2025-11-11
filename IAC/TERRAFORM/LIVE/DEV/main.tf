# verificar la cuenta donde aplica

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

# referencia de modulos

module "EFS" {
  source = "../../module/EFS"

  EFS_Name = var.EFS_Name

}
