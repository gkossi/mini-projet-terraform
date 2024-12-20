# Configuration du Provider AWS
provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["${var.aws_credentials}"]
}

# Configuration du backend s3
terraform {
  backend "s3" {
    bucket     = "mini-projet-terraform-backend"
    key        = "mini-projet-terraform.tfstate"
    region     = "us-east-1"
    shared_credentials_files = ["C:/Users/BORIS/Downloads/aws_credentials"]
  }
}
/* terraform {
  backend "s3" {
    bucket     = var.s3_bucket
    key        = var.s3_bucket_key
    region     = var.aws_region
    shared_credentials_files = ["${var.aws_credentials}"]
  }
} */

# Création du volume EBS : Appel du module ebs
module "ebs" {
  source = "../modules/ebs"
}

# Création du groupe de sécurité : Appel du module sg
module "sg" {
  source = "../modules/sg"
}

# Création de la VM : Appel du module ec2
module "ec2" {
  # Définition de la source du module EC2
  source       = "../modules/ec2"

  # Utilisation des valeurs des paramètres fournis par les modules
  # security_groups = module.sg.mpt_sg_name
  # associate_public_ip_address = true
  //ec2_sg = module.sg.mpt_sg_name
  //ec2_public_ip = module.eip.eip_public_ip
  availability_zone = module.ebs.ebs_az
  security_groups = [module.security_group.sg_id]
  //associate_public_ip_address = true

  # S'assurer que l'EBS est attaché
  depends_on = [aws_volume_attachment.myebs_attachment]

}

# Création de la ressource pour attacher le volume EBS à la VM
resource "aws_volume_attachment" "myebs_attachement" {
  device_name = "/dev/sdb"
  instance_id = module.ec2.ec2_id
  volume_id   = module.ebs.ebs_id
}

# Création de l'EIP : Appel du module eip
module "eip" {
  source = "../modules/eip"
  //instance_id = module.ec2.ec2_id
}

# Création de la ressource pour attacher l'EIP' à la VM
resource "aws_eip_association" "myeip_association" {
  instance_id   = module.ec2.ec2_id
  allocation_id = module.eip.eip_id
}