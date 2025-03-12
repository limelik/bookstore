resource "aws_ecr_repository" "client" {
  name = "bookstore-client"
  image_scanning_configuration { scan_on_push = true }
}

resource "aws_ecr_repository" "server" {
  name = "bookstore-server"
  image_scanning_configuration { scan_on_push = true }
}

resource "aws_ecr_repository" "nginx" {
  name = "bookstore-nginx"
  image_scanning_configuration { scan_on_push = true }
}
