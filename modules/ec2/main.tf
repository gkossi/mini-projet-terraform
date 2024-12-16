# Obtenir dynamiquement la dernière version de ubuntu bionic
data "aws_ami" "ubuntu_bionic" {
  most_recent = true
  owners      = ["099720109477"] # ID du propriétaire officiel des AMIs Ubuntu dans AWS

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Définition de l'instance EC2 à déployer
resource "aws_instance" "myec2" {
  ami             = data.aws_ami.ubuntu_bionic.id
  instance_type   = var.ec2_instance_type
  tags            = var.ec2_common_tag
  key_name        = var.ec2_key_name #"expertdevops" devops-kossi
  security_groups = ["${var.aws_sg}"]

  # Connexion à la VM et installation de nginx
  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx",
      "sudo echo <center><h1>Hello Eazytraining !!!</h1><h2>Bienvenue dans le Mini-Projet Terraform réalisé par Kossi GBENOU !</h2></center> > /usr/share/nginx/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = var.ec2_user
      private_key = file("C:/Users/BORIS/Downloads/${var.ec2_key_name}.pem")
      host        = self.public_ip
    }
  }

  # Enregistrement des informations (ip publique, ID et AZ) de la VM dans un fichier en local sur mon PC
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${self.public_ip}; ID: ${aws_instance.myec2.id}; AZ: ${aws_instance.myec2.availability_zone} > infos_ec2.txt"
  }

  # Supression automatique des volumes supplémentaires associés à notre VM
  root_block_device {
    delete_on_termination = true
  }

}