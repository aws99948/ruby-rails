resource "aws_db_instance" "postgresql" {
  identifier          = "ruby-app"
  allocated_storage   = 8
  engine              = "postgres"
  engine_version      = "11.16"
  instance_class      = "db.t2.micro"
  storage_type        = "gp2"
  password            = "login1-2"
  username            = "appadmin"
  skip_final_snapshot = true
  tags = {
    Name         = "Ruby_App_postgress_db"
    CreationDate = "14/10/2023"
    Owner        = "demo@example.com"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "ruby-app-bucket-2023"
}