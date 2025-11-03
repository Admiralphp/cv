# 🚀 Guide de Démarrage Rapide - TP CI/CD

## ⚡ Instructions Rapides

### 1️⃣ Prérequis

Assurez-vous d'avoir installé :
- Git
- Docker Desktop
- Un compte GitHub
- Un compte Docker Hub

### 2️⃣ Vérifications Initiales

```powershell
# Vérifier Git
git --version

# Vérifier Docker
docker --version
docker-compose --version

# Vérifier que Docker Desktop est en cours d'exécution
docker ps
```

---

## 📝 Étapes à Suivre

### ✅ Étape 1-3 : Git (DÉJÀ FAIT)

Le dépôt Git a déjà été initialisé avec :
- ✅ Commit initial "Version 1"
- ✅ Branche `master` (main)
- ✅ Branche `dev`

### 🌐 Étape 4 : GitHub Pages

1. **Créer un repository sur GitHub**
   - Nom : `VOTRE_USERNAME.github.io`
   - Public
   - Ne pas initialiser avec README

2. **Configurer le remote et pousser**

```powershell
# Remplacer VOTRE_USERNAME par votre nom d'utilisateur GitHub
git remote add origin https://github.com/VOTRE_USERNAME/VOTRE_USERNAME.github.io.git

# Renommer master en main (optionnel mais recommandé)
git branch -M main

# Pousser la branche main
git push -u origin main

# Pousser la branche dev
git push -u origin dev
```

3. **Activer GitHub Pages**
   - Aller dans Settings > Pages
   - Source : Deploy from a branch
   - Branch : main / (root)
   - Save

4. **Accéder au CV**
   - URL : `https://VOTRE_USERNAME.github.io/cv-mohamed-essid.html`

---

### 🐳 Étape 5-6 : Docker (DÉJÀ FAIT)

Les fichiers suivants ont été créés :
- ✅ `Dockerfile`
- ✅ `docker-compose.yml`

### 🏗️ Étape 7 : Construire l'Image Docker

```powershell
# Construction de l'image
docker build -t cv-mohamed-essid .

# Vérifier que l'image est créée
docker images
```

### 🏷️ Étape 8 : Créer le Tag

```powershell
# Remplacer VOTRE_DOCKERHUB_USERNAME par votre username Docker Hub
docker tag cv-mohamed-essid VOTRE_DOCKERHUB_USERNAME/cv:v1

# Vérifier
docker images | Select-String "cv"
```

### 📤 Étape 9 : Pousser sur Docker Hub

```powershell
# Se connecter à Docker Hub
docker login
# Entrer username et password

# Pousser l'image
docker push VOTRE_DOCKERHUB_USERNAME/cv:v1
```

### 📦 Étape 10 : Déployer avec Docker Compose

**Option 1 : Variable d'environnement temporaire**
```powershell
# Définir la variable (valable pour cette session)
$env:DOCKER_USERNAME="VOTRE_DOCKERHUB_USERNAME"

# Lancer le stack
docker-compose up -d
```

**Option 2 : Fichier .env (Recommandé)**
```powershell
# Créer le fichier .env
echo "DOCKER_USERNAME=VOTRE_DOCKERHUB_USERNAME" > .env

# Lancer le stack
docker-compose up -d
```

### 🌐 Étape 11 : Tester

Ouvrir un navigateur et accéder à : **http://localhost:8005**

---

## 🎯 Commandes Utiles

### Docker

```powershell
# Voir les conteneurs en cours
docker ps

# Voir les logs
docker-compose logs -f

# Arrêter le stack
docker-compose down

# Redémarrer
docker-compose restart

# Reconstruire et redémarrer
docker-compose up -d --build
```

### Git

```powershell
# Voir le statut
git status

# Voir les branches
git branch

# Changer de branche
git checkout main
git checkout dev

# Voir l'historique
git log --oneline --graph --all
```

---

## 📸 Captures d'Écran à Prendre

Pendant que vous exécutez ces commandes, prenez des captures d'écran et placez-les dans le dossier `screenshots/` :

1. ✅ `cv-preview.png` - CV ouvert dans le navigateur
2. ✅ `git-init.png` - Résultat de `git log`
3. ✅ `git-branch-dev.png` - Résultat de `git branch`
4. ✅ `github-pages-config.png` - Configuration dans GitHub
5. ✅ `github-pages-live.png` - CV en ligne
6. ✅ `docker-build.png` - Résultat de `docker build`
7. ✅ `docker-test-localhost.png` - Test sur localhost:8080
8. ✅ `docker-tag.png` - Résultat de `docker images`
9. ✅ `docker-login.png` - Connexion Docker Hub
10. ✅ `docker-push.png` - Push vers Docker Hub
11. ✅ `dockerhub-repo.png` - Repository sur Docker Hub
12. ✅ `docker-compose-up.png` - `docker-compose up -d`
13. ✅ `cv-localhost-8005.png` - CV sur localhost:8005

---

## ⚠️ Troubleshooting

### Problème : Port 8005 déjà utilisé

```powershell
# Trouver le processus qui utilise le port 8005
netstat -ano | findstr :8005

# Arrêter le conteneur s'il tourne déjà
docker-compose down

# Ou changer le port dans docker-compose.yml
# ports:
#   - "8006:80"  # Utiliser 8006 au lieu de 8005
```

### Problème : Docker daemon not running

```powershell
# Ouvrir Docker Desktop et attendre qu'il démarre
# Puis réessayer les commandes Docker
```

### Problème : Permission denied sur Git

```powershell
# Configurer Git avec vos identifiants
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

### Problème : Image not found sur Docker Hub

```powershell
# Vérifier que vous avez bien pushé l'image
docker images

# Re-pousser si nécessaire
docker push VOTRE_DOCKERHUB_USERNAME/cv:v1

# Vérifier que l'image est publique sur hub.docker.com
```

---

## 🎓 Points de Contrôle

Avant de rendre le TP, vérifiez que :

- [ ] Le dépôt Git local existe avec 2 branches (main et dev)
- [ ] Le repository GitHub existe avec les 2 branches
- [ ] Le CV est accessible sur `VOTRE_USERNAME.github.io/cv-mohamed-essid.html`
- [ ] L'image Docker a été créée
- [ ] L'image est taguée avec `VOTRE_DOCKERHUB_USERNAME/cv:v1`
- [ ] L'image est disponible sur Docker Hub
- [ ] Le fichier `docker-compose.yml` existe
- [ ] Le conteneur tourne et expose le port 8005
- [ ] Le CV est accessible sur `http://localhost:8005`
- [ ] Le README.md est complet avec toutes les étapes documentées
- [ ] Les captures d'écran sont présentes dans le dossier `screenshots/`

---

## 📌 Checklist Finale

```
✅ CV HTML5/CSS3 créé
✅ Git initialisé avec commit "Version 1"
✅ Branche dev créée
✅ Repository GitHub créé et configuré
✅ GitHub Pages activé et fonctionnel
✅ Les 2 branches (main et dev) sont sur GitHub
✅ Dockerfile créé
✅ Image Docker construite
✅ Image taguée
✅ Image poussée sur Docker Hub
✅ docker-compose.yml créé
✅ Application déployée sur port 8005
✅ Test navigateur réussi
✅ README.md complet avec documentation
✅ Captures d'écran ajoutées
```

---

## 🎉 Félicitations !

Si tous les points de contrôle sont validés, votre TP est terminé !

**Bon courage ! 🚀**
