# ✨ TP CI/CD - Prise en Main - PRÊT À UTILISER

## 🎯 État du Projet

### ✅ CE QUI EST DÉJÀ FAIT

1. **CV One-Page HTML5/CSS3** ✅
   - Fichier : `cv-mohamed-essid.html`
   - Design moderne et responsive
   - Prêt à être déployé

2. **Dépôt Git Local** ✅
   - Initialisé avec `git init`
   - Commit initial : "Version 1"
   - 2 branches créées : `master` et `dev`

3. **Fichiers Docker** ✅
   - `Dockerfile` : Configuration pour conteneuriser le CV avec nginx
   - `docker-compose.yml` : Configuration pour déployer sur le port 8005

4. **Documentation** ✅
   - `README.md` : Documentation complète du projet
   - `INSTRUCTIONS.md` : Guide pas à pas
   - `SCRIPTS.md` : Scripts PowerShell utiles
   - `.gitignore` : Fichiers à exclure de Git
   - `.env.example` : Exemple de configuration

### 📋 CE QU'IL RESTE À FAIRE

Suivez ces étapes dans l'ordre :

---

## 🚀 ÉTAPE 4 : GitHub Pages

### Actions à réaliser :

1. **Créer un compte GitHub** (si pas déjà fait)
   - Aller sur https://github.com
   - S'inscrire ou se connecter

2. **Créer un nouveau repository**
   - Nom : `VOTRE_USERNAME.github.io` (remplacer par votre username)
   - Visibilité : **Public**
   - ❌ Ne PAS initialiser avec README, .gitignore ou LICENSE

3. **Configurer le remote Git**

```powershell
# Remplacer VOTRE_USERNAME par votre nom d'utilisateur GitHub
git remote add origin https://github.com/VOTRE_USERNAME/VOTRE_USERNAME.github.io.git

# Renommer la branche en main (optionnel)
git branch -M main

# Pousser la branche main
git push -u origin main

# Pousser la branche dev
git checkout dev
git push -u origin dev

# Retourner sur main
git checkout main
```

4. **Activer GitHub Pages**
   - Aller dans le repository sur GitHub
   - Cliquer sur **Settings**
   - Dans le menu de gauche, cliquer sur **Pages**
   - Source : **Deploy from a branch**
   - Branch : Sélectionner **main** et **(root)**
   - Cliquer sur **Save**
   - Attendre 1-2 minutes

5. **Vérifier le déploiement**
   - Accéder à : `https://VOTRE_USERNAME.github.io/cv-mohamed-essid.html`

### ✅ Capture d'écran à prendre :
- Configuration GitHub Pages
- CV en ligne sur GitHub Pages

---

## 🐳 ÉTAPES 5-6 : Docker - Build

### Actions à réaliser :

1. **Construire l'image Docker**

```powershell
# Construction
docker build -t cv-mohamed-essid .

# Vérification
docker images
```

2. **Tester l'image localement** (optionnel mais recommandé)

```powershell
# Lancer un conteneur de test
docker run -d -p 8080:80 --name cv-test cv-mohamed-essid

# Ouvrir le navigateur sur http://localhost:8080

# Arrêter et supprimer le test
docker stop cv-test
docker rm cv-test
```

### ✅ Capture d'écran à prendre :
- Résultat de `docker build`
- CV sur localhost:8080 (si test effectué)

---

## 🏷️ ÉTAPE 7 : Tag de l'Image

### Actions à réaliser :

1. **Créer un compte Docker Hub** (si pas déjà fait)
   - Aller sur https://hub.docker.com
   - S'inscrire (gratuit)
   - Retenir votre **username**

2. **Créer le tag**

```powershell
# Remplacer VOTRE_DOCKERHUB_USERNAME par votre username Docker Hub
docker tag cv-mohamed-essid VOTRE_DOCKERHUB_USERNAME/cv:v1

# Vérifier
docker images | Select-String "cv"
```

### ✅ Capture d'écran à prendre :
- Résultat de `docker images` montrant les deux images

---

## 📤 ÉTAPE 8 : Push vers Docker Hub

### Actions à réaliser :

```powershell
# Se connecter à Docker Hub
docker login
# Entrer votre username Docker Hub
# Entrer votre password

# Pousser l'image
docker push VOTRE_DOCKERHUB_USERNAME/cv:v1
```

**Vérification :**
- Aller sur https://hub.docker.com
- Vérifier que le repository `cv` apparaît avec le tag `v1`

### ✅ Capture d'écran à prendre :
- Résultat de `docker push`
- Repository sur Docker Hub

---

## 📦 ÉTAPE 9 : Docker Compose

### Actions à réaliser :

1. **Créer le fichier .env**

```powershell
# Copier l'exemple
Copy-Item .env.example .env

# Éditer le fichier .env et remplacer VOTRE_DOCKERHUB_USERNAME
# Par votre vrai username Docker Hub
```

Ou directement :

```powershell
echo "DOCKER_USERNAME=VOTRE_DOCKERHUB_USERNAME" > .env
```

2. **Vérifier le fichier docker-compose.yml**
   - Il doit utiliser `${DOCKER_USERNAME}/cv:v1`
   - Port mapping : `8005:80` ✅

### ✅ Le fichier `docker-compose.yml` est déjà créé !

---

## 🚢 ÉTAPE 10 : Déploiement

### Actions à réaliser :

```powershell
# Démarrer le stack
docker-compose up -d

# Vérifier le statut
docker-compose ps

# Voir les logs (optionnel)
docker-compose logs -f
# Ctrl+C pour sortir
```

### ✅ Capture d'écran à prendre :
- Résultat de `docker-compose up -d`
- Résultat de `docker-compose ps`

---

## 🌐 ÉTAPE 11 : Test Final

### Actions à réaliser :

1. **Ouvrir le navigateur**
   - URL : http://localhost:8005

2. **Vérifier que le CV s'affiche correctement**
   - Toutes les sections sont visibles
   - Le design est correct
   - Pas d'erreur 404

3. **Test technique** (optionnel)

```powershell
# Vérifier que le port est ouvert
netstat -an | Select-String "8005"

# Test HTTP
curl http://localhost:8005
```

### ✅ Capture d'écran à prendre :
- CV sur localhost:8005 dans le navigateur

---

## 📸 Étape Finale : Captures d'Écran

### Checklist des captures à ajouter dans `screenshots/` :

- [ ] `cv-preview.png` - CV dans le navigateur (local ou GitHub Pages)
- [ ] `git-init.png` - `git log --oneline --graph --all`
- [ ] `git-branch-dev.png` - `git branch`
- [ ] `github-pages-config.png` - Configuration dans GitHub
- [ ] `github-pages-live.png` - CV sur GitHub Pages
- [ ] `docker-build.png` - Résultat de `docker build`
- [ ] `docker-tag.png` - `docker images`
- [ ] `docker-login.png` - Connexion Docker Hub
- [ ] `docker-push.png` - Push vers Docker Hub
- [ ] `dockerhub-repo.png` - Repository sur Docker Hub
- [ ] `docker-compose-up.png` - `docker-compose up -d`
- [ ] `cv-localhost-8005.png` - CV sur localhost:8005

---

## 📚 Fichiers à Consulter

- **README.md** : Documentation complète et détaillée
- **INSTRUCTIONS.md** : Guide rapide avec toutes les commandes
- **SCRIPTS.md** : Scripts PowerShell pour automatiser (optionnel)
- **.env.example** : Exemple de configuration

---

## ⚠️ Troubleshooting Rapide

### Docker ne démarre pas
```powershell
# Vérifier que Docker Desktop est lancé
docker ps
```

### Port 8005 déjà utilisé
```powershell
# Arrêter le conteneur existant
docker-compose down

# Ou modifier le port dans docker-compose.yml
```

### Erreur Git push
```powershell
# Configurer vos identifiants
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

### Image non trouvée sur Docker Hub
```powershell
# Vérifier que l'image a bien été poussée
docker images

# Re-pousser si nécessaire
docker push VOTRE_DOCKERHUB_USERNAME/cv:v1
```

---

## 🎯 Checklist Finale

Avant de rendre le TP, vérifiez :

- [ ] Dépôt Git local créé avec 2 branches (master/main et dev)
- [ ] Repository GitHub créé avec les 2 branches
- [ ] GitHub Pages activé et CV accessible en ligne
- [ ] Image Docker construite
- [ ] Image taguée avec votre username Docker Hub
- [ ] Image disponible sur Docker Hub (publique)
- [ ] Fichier .env créé avec votre username
- [ ] Docker Compose démarré
- [ ] CV accessible sur http://localhost:8005
- [ ] README.md complété (si nécessaire)
- [ ] Captures d'écran ajoutées dans screenshots/

---

## 🎓 Commandes Essentielles

```powershell
# Git
git status
git log --oneline --graph --all
git branch

# Docker
docker images
docker ps
docker-compose ps
docker-compose logs

# Test
curl http://localhost:8005
```

---

## 📞 Besoin d'Aide ?

Consultez :
1. **INSTRUCTIONS.md** - Guide détaillé pas à pas
2. **README.md** - Documentation complète
3. **SCRIPTS.md** - Scripts d'automatisation

---

## 🎉 Bon Travail !

Tout est prêt ! Suivez les étapes ci-dessus et vous aurez terminé le TP avec succès.

**Bonne chance ! 🚀**

---

**Rappel Important** : N'oubliez pas de remplacer :
- `VOTRE_USERNAME` par votre nom d'utilisateur GitHub
- `VOTRE_DOCKERHUB_USERNAME` par votre nom d'utilisateur Docker Hub
