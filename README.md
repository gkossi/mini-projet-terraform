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

## MON PLAN DE TRAVAIL :  LES OPERATIONS A EFFECTUEES
1. Etape N°1 : Pour commencer, on va d'abord créer le bucket S3 qui va servir de backend pour stocker le fichier terraform.tfstate.
2. Etape N°2 : Créer les différents modules (EC2, EBS, EIP, SG) qui vont permettre de provisionner une infra complète :
	- Créer un répertoire nommé ***modules*** à la racine du projet et y créer à l'intérieur un sous-répertoire pour chacun des module ***ec2***, ***ebs***, ***eip*** et ***sg*** qui vont contenir les fichiers manifests.
	- Créer dans chacun des sous-répertoires un fichier ***variables.tf*** pour variabiliser les éléments nécessaires notamment : le type d'instance,le tag et le groupe de securité
	- Créer dans chacun des sous-répertoires un fichier ***main.tf*** qui va contenir l'ensemble des éléments non sensibles notamment : le data source, l'instance EC2, le volume EBS, le groupe de sécurité et l'adresse ip publique
3. Etape N°3 : Créer l'environnement (APP) à provisionner :
	- Créer un répertoire nommé ***app*** à la racine du projet qui va contenir les fichiers manifests
	- Créer à l'intérieur du répertoire ***app***, un fichier ***main.tf*** qui va contenir l'ensemble des éléments sensibles (le provider aws et le backend S3) et non sensibles (l'appel du module EC2)

## REALISATIONS ETAPE PAR ETAPE

### L'ORGANISATION DU REPERTOIRE DE TRAVAIL


### REALISATION ETAPE PAR ETAPE


#### ETAPE N°1 : 

