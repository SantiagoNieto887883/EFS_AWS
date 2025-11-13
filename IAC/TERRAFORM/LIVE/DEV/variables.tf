variable "enable_redis" { type = bool }
variable "project" { type = string }
variable "environment" { type = string }
variable "aws_region" { type = string }
variable "profile" { type = string }

#EFS
variable "EFS_Name" { type = string }
variable "AP1_Name" { type = string }
variable "AP2_Name" { type = string }
variable "root_directory_1" { type = string }
variable "root_directory_2" { type = string }