#resource "aws_instance" "web" {
 # ami           = "ami-08b5b3a93ed654d19"
  #instance_type = "t3.micro"

  #tags = {
   # Name = "HelloWorld"
 # }
#}


terraform {
  backend "http" {
    address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/SFTY_Training/workspaces/awsstatemigration/terraform-backend?accountIdentifier=ucHySz2jQKKWQweZdXyCog"
    username = "harness"
    lock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/SFTY_Training/workspaces/awsstatemigration/terraform-backend/lock?accountIdentifier=ucHySz2jQKKWQweZdXyCog"
    lock_method = "POST"
    unlock_address = "https://app.harness.io/gateway/iacm/api/orgs/default/projects/SFTY_Training/workspaces/awsstatemigration/terraform-backend/lock?accountIdentifier=ucHySz2jQKKWQweZdXyCog"
    unlock_method = "DELETE"
  }
}
