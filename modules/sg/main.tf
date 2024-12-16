# Définition du groupe de sécurité à appliquer à notre infrastructure
resource "aws_security_group" "mysg" {
  name        = var.sg_name
  tags        = var.sg_common_tag
  description = "Autorisation des trafiques entrants et sortants"

  # Règle pour autoriser le trafic entrant en HTTPS (port 443)
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permettre l'accès de partout
  }

  # Règle pour autoriser le trafic entrant en HTTP (port 80)
  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permettre l'accès de partout
  }

  # Règle pour autoriser le trafic entrant en SSH (port 22)
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permettre l'accès de partout
  }

  # Règle pour autoriser tout type de trafic sortant de la VM
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Permettre l'accès de partout
  }
}