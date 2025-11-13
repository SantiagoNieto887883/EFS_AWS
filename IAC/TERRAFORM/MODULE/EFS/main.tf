resource "aws_efs_file_system" "wp" {
  encrypted = true
  tags = {
    Name = var.EFS_Name
  }
    lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

resource "aws_efs_access_point" "mysql_dev" {
    tags = {
    Name = var.AP1_Name
  }
  file_system_id = aws_efs_file_system.wp.id
  posix_user {
    uid = 999
    gid = 999
  }
  root_directory {
    path = var.root_directory_1
    creation_info {
      owner_uid   = 999
      owner_gid   = 999
      permissions = "750"
    }
  }
}

resource "aws_efs_access_point" "mysql_preprod" {
    tags = {
    Name = var.AP2_Name
  }
  file_system_id = aws_efs_file_system.wp.id
  posix_user {
    uid = 999
    gid = 999
  }
  root_directory {
    path = var.root_directory_2
    creation_info {
      owner_uid   = 999
      owner_gid   = 999
      permissions = "750"
    }
  }
}
