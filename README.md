# Script PowerShell Ultra-Complet : Configuration d'Environnement de Développement

Ce dépôt contient un script PowerShell conçu pour configurer un environnement de développement complet sur une machine Windows. Il installe les langages, frameworks, outils, et bases de données les plus courants, tout en configurant **Oh My Posh** pour une expérience terminal élégante.

---

## 📋 Prérequis

1. **Système d'exploitation** : Windows 10 ou Windows 11.
2. **Droits administrateur** : Ce script doit être exécuté en tant qu'administrateur.
3. **PowerShell** : Assurez-vous que PowerShell est installé (par défaut sur Windows).

---

## 🚀 Fonctionnalités du Script

### Outils Essentiels
- **Git** : Gestion de version.
- **Visual Studio Code** : Éditeur de code moderne.
- **Windows Terminal** : Terminal polyvalent.
- **Oh My Posh** : Thèmes élégants pour le terminal.
- **7-Zip** : Gestion des archives.
- **Fira Code (Nerd Font)** : Police avec support des icônes.

### Langages et Frameworks
Le script installe les langages suivants ainsi que leurs frameworks populaires :

- **Node.js** avec **Express**.
- **Python** avec **Flask** et **Django**.
- **Ruby** avec **Rails**.
- **PHP** avec **Laravel**.
- **Go** avec **Gin**.
- **Java** avec **Spring Boot CLI**.
- **Rust** avec **Rocket**.

### Bases de Données
- **MySQL Workbench**
- **PostgreSQL**
- **SQLite**
- **MongoDB Compass**

### Outils Web et UI/UX
- **Postman** : Test d'API.
- **Insomnia** : Test d'API.
- **Figma** : Design UI/UX.

---

## 📦 Installation

1. Clonez ce dépôt ou téléchargez le fichier `setup-dev-complete.ps1`.
2. Ouvrez PowerShell **en tant qu'administrateur**.
3. Exécutez le script :
   ```powershell
   .\setup-dev-complete.ps1
   ```
4. Suivez les instructions à l'écran.

---

## 🛠️ Fonctionnement

### Étape 1 : Vérification et Installation de Winget
Si Winget n'est pas installé, le script propose de l'installer automatiquement.

### Étape 2 : Installation des Outils Essentiels
Les outils de base tels que Git, Visual Studio Code, et Windows Terminal sont installés.

### Étape 3 : Installation des Langages et Frameworks
Chaque langage est installé avec son gestionnaire de paquets et ses frameworks principaux.

### Étape 4 : Installation des Bases de Données
Des outils pour MySQL, PostgreSQL, SQLite et MongoDB sont configurés.

### Étape 5 : Configuration d'Oh My Posh
**Oh My Posh** est installé et configuré avec un thème élégant. La configuration est ajoutée automatiquement au `$PROFILE`.

---

## 📘 Exemple de Sortie
Voici un exemple de sortie lors de l'exécution du script :

```
=== Configuration de l'environnement de développement ===

--- Installation de Git ---
Git installé avec succès.

--- Installation de Node.js (LTS) + Express ---
Node.js installé avec succès.
Configuration post-installation pour Node.js...
Express installé avec succès.

--- Installation de Ruby + Rails ---
Ruby installé avec succès.
Configuration post-installation pour Ruby...
Rails installé avec succès.

=== Configuration complète ! Redémarrez votre terminal pour finaliser l'installation ===
```

---

## 🌟 Personnalisation

Si vous souhaitez ajouter d'autres outils, frameworks ou packages, modifiez directement le fichier `setup-dev-complete.ps1`.

Ajoutez vos propres packages Winget ou scripts de configuration dans les sections appropriées.
