resource "aws_efs_file_system" "wp" {
  encrypted = true
  tags = {
    Name = var.EFS_Name
  }
}

resource "aws_efs_access_point" "mysql_dev" {
  file_system_id = aws_efs_file_system.wp.id
  posix_user {
    uid = 999
    gid = 999
  }
  root_directory {
    path = "/mysql/dev"
    creation_info {
      owner_uid   = 999
      owner_gid   = 999
      permissions = "750"
    }
  }
}

resource "aws_efs_access_point" "mysql_preprod" {
  file_system_id = aws_efs_file_system.wp.id
  posix_user {
    uid = 999
    gid = 999
  }
  root_directory {
    path = "/mysql/preprod"
    creation_info {
      owner_uid   = 999
      owner_gid   = 999
      permissions = "750"
    }
  }
}
