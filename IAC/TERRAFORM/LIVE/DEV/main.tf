# verificar la cuenta donde aplica

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

# referencia de modulos

module "EFS" {
  source = "../../module/EFS"

  EFS_Name = var.EFS_Name
  AP1_Name = var.AP1_Name
  AP2_Name = var.AP2_Name
  root_directory_1 = var.root_directory_1
  root_directory_2 = var.root_directory_2

}
