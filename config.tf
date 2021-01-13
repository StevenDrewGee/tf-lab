## variables definition
variable "aws_access_key" {}
variable "aws_secret_key" {}
# variable "private_key_path" {}
variable "key_name" {default = "souza-key-use-1a"}

### providers definition
provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "us-east-1"
}

### resources definition
resource "aws_instance" "webserver" {
    ami = "ami-09c5258a58aeabe14" # original class "ami-b2527ad2"
    instance_type = "t2.micro"
    tags = {
        Name = "tf-lab-01"
        }
    key_name = var.key_name
}

### output definitions
output "aws_instance_public_dns" {
    value = "aws_instance.webserver.public_dns"
}
