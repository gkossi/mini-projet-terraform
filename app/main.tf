# Configuration du Provider AWS
provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["${var.aws_credentials}"]
}

# Configuration du backend s3
terraform {
  backend "s3" {
    bucket                   = "mini-projet-terraform-backend"
    key                      = "mini-projet-terraform.tfstate"
    region                   = "us-east-1"
    shared_credentials_files = ["C:/Users/BORIS/Downloads/aws_credentials"]
  }
}

# Création du volume EBS : Appel du module ebs
module "ebs" {
  source = "../modules/ebs"
}

# Création du groupe de sécurité : Appel du module sg
module "sg" {
  source = "../modules/sg"
}

# Création de l'EIP : Appel du module eip
module "eip" {
  source = "../modules/eip"
}

# Création de la VM : Appel du module ec2
module "ec2" {
  # Définition de la source du module EC2
  source = "../modules/ec2"
  ec2_sg = module.sg.sg_name_output
}

# Création de la ressource pour attacher le volume EBS à la VM
resource "aws_volume_attachment" "myebs_attachement" {
  device_name = "/dev/sdb"
  volume_id   = module.ebs.ebs_id_output
  instance_id = module.ec2.ec2_id_output
}

# Création de la ressource pour attacher l'EIP' à la VM
resource "aws_eip_association" "myeip_association" {
  allocation_id = module.eip.eip_id_output
  instance_id   = module.ec2.ec2_id_output
}