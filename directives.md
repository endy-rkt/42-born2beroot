Partie obligatoire

Ce projet consiste à installer et configurer un serveur Debian minimal en suivant des directives spécifiques.

Prérequis

Système d'exploitation : Debian latest stable (pas de testing/unstable)
Interface graphique : interdite (X.org ou équivalent)
Partitionnement : minimum 2 partitions chiffrées en utilisant LVM
Services :
SSH (port 4242)
Pare-feu UFW (ou firewalld pour Rocky)
monitoring.sh (script bash)
Utilisateurs :
root
<votre_login> (appartient aux groupes user42 et sudo)
Configuration

1. Partitionnement et création de partitions

Installer Debian en utilisant le mode expert.
Créer au minimum 2 partitions chiffrées en utilisant LVM :
/ (racine)
/home (pour les données des utilisateurs) 2. Manipulation des utilisateurs

Créer un utilisateur avec votre login.
Ajouter l'utilisateur au groupe user42 et sudo.
Définir une politique de mot de passe fort pour tous les utilisateurs. 3. Pare-feu (UFW)

Installer et configurer UFW.
Ouvrir le port 4242 pour SSH.
Refuser toutes les autres connexions entrantes. 4. Règles sudo

Configurer sudo avec les règles suivantes :
Limite d'authentification : 3 essais
Message d'erreur personnalisé
Journalisation des actions (inputs/outputs)
Mode TTY activé
Chemins restreints 5. Règles de mot de passe

Définir une politique de mot de passe fort pour tous les utilisateurs :
Expiration : 30 jours
Longueur minimale : 10 caractères
Complexité : majuscule, minuscule, chiffre
Pas de caractères identiques consécutifs
Pas de nom d'utilisateur dans le mot de passe
Le mot de passe root doit suivre ces règles 6. Surveillance avec Bash

Créer un script monitoring.sh qui affiche toutes les 10 minutes :
Architecture et version du kernel
Nombre de processeurs (physiques et virtuels)
Mémoire vive et disque (utilisation et disponible)
Utilisation CPU
Date et heure du dernier redémarrage
Utilisation de LVM
Nombre de connexions et d'utilisateurs
Adresse IP et MAC
Nombre de commandes sudo 7. Serveur Web

Installation et configuration d'un serveur web (optionnel)

Nginx, Apache2, Lighttpd, etc.
Choisir un service et justifier son choix. 8. Autres règles importantes

Activer AppArmor (Debian) ou SELinux (Rocky).
Mettre à jour le système régulièrement.
Sécuriser les services installés.
Évaluation

La partie bonus sera évaluée uniquement si la partie obligatoire est parfaite (complète et sans aucun dysfonctionnement).
