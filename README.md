# MINI-PROJET-TERRAFORM : Déployez une infra complète

## INFORMATIONS A PROPOS DE L'AUTEUR

Session           : Bootcamp DevOps N°15

Period            : September - November

First & Last Name : Kossi GBENOU

LinkedIn          : https://www.linkedin.com/in/gkossi/


## ENONCE

L'énoncé du présent projet se présente comme suit :

> ![00 :: Enoncé du projet] ![](images/00-enonce/00-enonce.jpg)


## PREREQUIS & WORKFLOW

Pour réaliser ce projet, il faut tout d'abord identifier les prérequis et aussi construire un worklow. Cette étape est illustrée sur l'image suivante  :

> ![01 :: PREREQUIS & WORKFLOW] ![](images/01-diagramme/DiagrammeMiniProjetTerraform.jpg)
<!--div align="center">
	<p>
<a href="https://www.terraform.io/" target="_blank"><img src="https://github.com/devicons/devicon/blob/v2.16.0/icons/terraform/terraform-original-wordmark.svg" width="300" height="300"/></a>
<a href="https://aws.amazon.com/fr/" target="_blank"><img src="https://github.com/devicons/devicon/blob/v2.16.0/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="300" height="300"/></a>
</p>
</div-->

## METHODLOGIE ET BONNES PRATIQUES
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

## PLAN DE TRAVAIL :  LES OPERATIONS A EFFECTUEES
1. Etape N°1 : Pour commencer, nous allons d'abord créer le bucket S3 ;
2. Etape N°2 : Créer les différents modules (EC2, EBS, EIP, SG) qui vont permettre de provisionner une infra complète. Pour se faire, nous allons procéder comme suit :
	- Créer un répertoire nommé ***modules*** à la racine du projet et y créer à l'intérieur un sous-répertoire pour chacun des module ***ec2***, ***ebs***, ***eip*** et ***sg*** qui vont contenir les fichiers manifests ;
	- Créer dans chacun des sous-répertoires un fichier ***variables.tf*** pour variabiliser les éléments nécessaires notamment : le type d'instance, le tag et le groupe de securité ;
	- Créer dans chacun des sous-répertoires un fichier ***main.tf*** qui va contenir l'ensemble des éléments non sensibles notamment : le data source, l'instance EC2, le volume EBS, le groupe de sécurité et l'adresse ip publique ;
3. Etape N°3 : Créer l'environnement (APP) à provisionner :
	- Créer un répertoire nommé ***app*** à la racine du projet qui va contenir les fichiers manifests ;
	- Créer à l'intérieur du répertoire ***app***, un fichier ***main.tf*** qui va contenir l'ensemble des éléments sensibles (le provider aws et le backend S3) et non sensibles (l'appel du module EC2).

## REALISATIONS ETAPE PAR ETAPE

### Etape N°1 : Création du bucket S3
Comme prévu dans le plan de travail, on va commencer par créer le buckect S3 qui va servir à stocker le state file de notre projet.

```bash
Amazon S3 -> Create bucket
```
> ![Création du bucket S3] ![](./images/02-buckets3/1-bucket-creation1.jpg)

> ![Création du bucket S3 (Suite)] ![](./images/02-buckets3/2-bucket-creation2.jpg)

### Etape N°2 : Création des modules

