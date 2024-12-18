# Configuration du Provider AWS
provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["${var.aws_credentials}"]
}

# Configuration du backend s3
terraform {
  backend "s3" {
    bucket     = var.s3_bucket
    key        = var.s3_bucket_key
    region     = var.aws_region
    shared_credentials_files = ["${var.aws_credentials}"]
  }
}

# Création de la VM : Appel du module EC2
module "ec2" {
  # Définition de la source du module EC2
  source       = "../modules/ec2"

  # Surcharge des différentes variables définies dans le module
  #instance_type = "t2.micro"

  /* aws_common_tag = {
    Name = "ec2-prod-kossi"
  } */

  #sg_name = "prod-sg-kossi"

  aws_sg_name = module.sg.ec2_security_group_id
  aws_public_ip = module.eip.ec2_eip

  aws_sg = module.sg.ec2_security_group_id
  aws_public_ip = module.eip.ec2_eip
}
