# MINI-PROJET-TERRAFORM : DÉPLOYEZ UNE INFRA COMPLÈTE

## INFORMATIONS A PROPOS DE L'AUTEUR

Session           : Bootcamp DevOps N°15

Period            : September - November

First & Last Name : Kossi GBENOU

LinkedIn          : https://www.linkedin.com/in/gkossi/

<!--
## ENONCE
![Texte Rouge](https://img.shields.io/badge/Texte-Rouge-red)
![ENONCE](https://img.shields.io/badge/ENONCE-red)
![ENONCE](https://img.shields.io/badge/ENONCE-rouge?style=for-the-badge&color=red)
-->

#
![ENONCE](https://img.shields.io/badge/ENONCE-red?style=for-the-badge)

L'énoncé du présent projet se présente comme suit :

> ![00 :: Enoncé du projet] ![](images/00-enonce/00-enonce.jpg)

<!--
	URL Encode online
	https://www.urlencoder.io/ 
-->
#
![PREREQUIS & WORKFLOW](https://img.shields.io/badge/PREREQUIS%20%26%20WORKFLOW-red?style=for-the-badge)

Pour réaliser ce projet, il faut tout d'abord identifier les prérequis et aussi construire un worklow. Cette étape est illustrée sur l'image suivante  :

> ![01 :: PREREQUIS & WORKFLOW] ![](images/01-diagramme/DiagrammeMiniProjetTerraform.jpg)
<!--div align="center">
	<p>
<a href="https://www.terraform.io/" target="_blank"><img src="https://github.com/devicons/devicon/blob/v2.16.0/icons/terraform/terraform-original-wordmark.svg" width="300" height="300"/></a>
<a href="https://aws.amazon.com/fr/" target="_blank"><img src="https://github.com/devicons/devicon/blob/v2.16.0/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="300" height="300"/></a>
</p>
</div-->

#
![METHODLOGIE ET BONNES PRATIQUES](https://img.shields.io/badge/METHODLOGIE%20ET%20BONNES%20PRATIQUES-red?style=for-the-badge)

Dans la réalisation de tout projet, il est nécessaire d'adopter une méthologie à laquelle il est aussi important d'associer des bonnes pratiques. Dans le cadre de ce projet, voici notre méthodologie ainsi que les bonnes pratiques associées :

1. Nous allons stocker le state file de l'infra sur un remote backend (S3) ;
2. Nous allons utiliser un compte IAM avec les droits Admin sur AWS ;
3. Nous allons fournir les paramètres (***ACCESS KEY*** et ***SECRET KEY***) d'accès au compte à partir du paramètre ***shared_credentials_files*** ;
3. Nous allons fournir la paire de clé (***PRIVATE_KEY***) permettant de se connecter à l'infra à partir du protocole SSH en utilisant la fonction ***file*** ;
4. Les dossiers du projet seront organisés de la facon suivantes :
	- Le dossier **modules**: comme son nom l'indique, c'est lui qui va contenir nos différents modules (EC2, EBS, EIP, SG) ;
	- Le dossier **app**: va représenter notre principale infra à provisionner. Il va contenir le manifest principal où seront appelés nos différents modules ;
	- Le dossier **images**: va servir à stocker les différentes catpures d'écran des réalisations;
	- Le fichier **.gitignore**: va contenir les infos sur les répertoires et fichiers à ignorer lors du Push du projet sur notre SCM;
	- Le fichier **infos_ec2.txt**: va servir à enregistrer certaines infos utiles de notre infra comme : PUBLIC IP, ID et AZ.

#
![PLAN DE TRAVAIL :  LES OPERATIONS A EFFECTUEES](https://img.shields.io/badge/PLAN%20DE%20TRAVAIL%20%3A%20%20LES%20OPERATIONS%20A%20EFFECTUEES-red?style=for-the-badge)

1. Etape N°1 : Pour commencer, nous allons d'abord créer le bucket S3 ;
2. Etape N°2 : Créer les différents modules (EC2, EBS, EIP, SG) qui vont permettre de provisionner une infra complète. Pour se faire, nous allons procéder comme suit :
	- Créer un répertoire nommé ***modules*** à la racine du projet et y créer à l'intérieur un sous-répertoire pour chacun des module ***ec2***, ***ebs***, ***eip*** et ***sg*** qui vont contenir les fichiers manifests ;
	- Créer dans chacun des sous-répertoires les fichiers suivants :

	```bash
	├── ebs                ├── sg                 ├── eip                ├── ec2
	│   ├── main.tf        │   ├── main.tf        │   ├── main.tf        │   ├── main.tf
	│   ├── outputs.tf     │   ├── outputs.tf     │   ├── outputs.tf     │   ├── outputs.tf
	│   └── variables.tf   │   └── variables.tf   │   └── variables.tf   │   └── variables.tf
	```

	- ***variables.tf*** : va servir à variabiliser les éléments nécessaires notamment le type d'instance, le tag et le groupe de securité ;
	- ***main.tf*** : va contenir l'ensemble des éléments non sensibles notamment le data source, l'instance EC2, le volume EBS, le groupe de sécurité et l'adresse ip publique ;
	- ***outputs.tf*** : va servir à rendre accessibles certaines valeurs à utiliser par d'autres modules
3. Etape N°3 : Créer l'environnement (APP) à provisionner :
	- Créer un répertoire nommé ***app*** à la racine du projet qui va contenir les fichiers manifests ;
	- Créer à l'intérieur du répertoire ***app***, un fichier ***main.tf*** qui va contenir l'ensemble des éléments sensibles (le provider aws et le backend S3) et non sensibles (l'appel du module EC2).

#
![REALISATIONS ETAPE PAR ETAPE](https://img.shields.io/badge/REALISATIONS%20ETAPE%20PAR%20ETAPE-red?style=for-the-badge)

### Etape N°1 : Création du bucket S3
Comme prévu dans notre plan de travail, on va commencer par créer le buckect S3 qui va servir à stocker le state file de notre projet.

```bash
Amazon S3 -> Create bucket
```

> ![Création du bucket S3] ![](./images/02-buckets3/1-bucket-creation1.jpg)

> ![Création du bucket S3 (Suite)] ![](./images/02-buckets3/2-bucket-creation2.jpg)

### Etape N°2 : Création des modules
<!--div>
Création des dossiers et fichiers :
mkdir -p mini-projet-terraform && cd mini-projet-terraform 
mkdir -p app modules/{ec2,eip,ebs,sg}
</div-->

#
1. **Module EBS :**
#
Ce module permet de déployer un volume EBS à associer à notre machine virtuelle EC2.
Le contenu des trois (03) fichiers de ce module se présentent comme suit :

- Le fichier ***variables.tf*** :

```bash
variable "ebs_az" {
  description = "La zone de disponibilité de l'EBS"
  type        = string
  default     = "us-east-1a"
}

variable "ebs_common_tag" {
  description = "Le tag sur le volume EBS"
  type = map(string)
  default = {
    Name = "ebs-mini-projet-terraform"
  }
}

variable "ebs_size" {
  description = "La taille du volume EBS en GB"
  type        = number
  default     = 10
}
```

- Le fichier ***main.tf*** :

```bash
# Définition du volume EBS
resource "aws_ebs_volume" "myebs" {
  availability_zone = var.ebs_az
  tags              = var.ebs_common_tag
  size              = var.ebs_size
}
```

- Le fichier ***outputs.tf*** :

```bash
output "ebs_id_output" {
  description = "L'ID du volume EBS"
  value = aws_ebs_volume.myebs.id
}
```


#
2. **Module SG :**
#
Ce module permet de créer un groupe de sécurité et de l'associer à notre machine virtuelle EC2.
Le contenu des trois (03) fichiers de ce module se présentent comme suit :

- Le fichier ***variables.tf*** :

```bash

```

- Le fichier ***main.tf*** :

```bash

```

- Le fichier ***outputs.tf*** :

```bash

```

#
3. **Module EIP :**
#
Ce module permet d'obtenir dynamiquement une adresse ip publique statique et de l'associer à notre machine virtuelle EC2.
Le contenu des trois (03) fichiers de ce module se présentent comme suit :

- Le fichier ***variables.tf*** :

```bash

```

- Le fichier ***main.tf*** :

```bash

```

- Le fichier ***outputs.tf*** :

```bash

```

#
4. **Module EC2 :**
#
Ce module permet de déployer une machine virtuelle EC2.
Le contenu des trois (03) fichiers de ce module se présentent comme suit :

- Le fichier ***variables.tf*** :

```bash

```

- Le fichier ***main.tf*** :

```bash

```

- Le fichier ***outputs.tf*** :

```bash

```

### Etape N°3 : Création de l'environnement (APP) à provisionner : Utilisation des modules

Ici, il s'agira de la mise en place de notre infra principale.
Comme décrit précédemment, nous allons créer un répertoire nommé ***app*** à la racine du projet qui va contenir les fichiers manifests (***variables.tf*** et ***main.tf***) ainsi que le fichier ***infos_ec2.txt***.
Le contenu des fichiers se présente comme suit :

- Le fichier ***variables.tf*** :

Ce fichier contient l'ensemble des éléments variabilisés (**region, credentials, bucket et bucket_key**).

```bash

```

- Le fichier ***main.tf*** :

Il va contenir l'ensemble des éléments sensibles (le provider aws et le backend S3) et non sensibles (l'appel du module EC2).

```bash

```

- Le fichier ***infos_ec2.txt*** :

Ce fichier va servir à enregistrer les informations de la VM après son déploiement.

### Etape N°4 : Déploiement de l'infrastructure

1. **Initialisation**

Pour démarrer le déploiement, nous allons commencer par l'initilisation qui va nous permettre de télécharger les plugins du provider AWS et aussi charger nos 4 modules (EBS, SG, EIP et EC2).
Pour se faire, nous allons nous positionner dans le répertoire **app** et ensuite exécuter la commande suivante :

```bash
terraform init
```

> ![1-Terraform init] ![](./images/03-deploy/1-terraform-init.jpg)