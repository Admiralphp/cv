# 📸 Guide pour Ajouter les Captures d'Écran au Compte Rendu HTML

## 🎯 Objectif

Ce guide explique comment ajouter vos captures d'écran au fichier `compte-rendu-tp.html` pour créer un compte rendu complet et professionnel.

---

## 📁 Structure Recommandée

```
Manip Intro/
├── compte-rendu-tp.html
├── screenshots/
│   ├── 01-git-init.png
│   ├── 02-git-branch-dev.png
│   ├── 03-github-repo-main.png
│   ├── 04-github-repo-dev.png
│   ├── 05-git-commits.png
│   ├── 06-github-pages-config.png
│   ├── 07-docker-build.png
│   ├── 08-docker-images.png
│   ├── 09-docker-push.png
│   ├── 10-dockerhub-repo.png
│   ├── 11-docker-compose-up.png
│   ├── 12-docker-ps.png
│   ├── 13-cv-localhost-8005.png
│   ├── 14-cv-github-pages.png
│   ├── 15-docker-desktop.png
│   └── 16-vscode-project.png
└── ...autres fichiers...
```

---

## 📸 Captures d'Écran à Prendre

### 1️⃣ Git & GitHub (6 captures)

1. **01-git-init.png** - Initialisation Git
   ```powershell
   git log --oneline --graph --all
   ```
   - Capturer le résultat montrant les commits et branches

2. **02-git-branch-dev.png** - Branche dev
   ```powershell
   git branch
   ```
   - Capturer la liste des branches locales

3. **03-github-repo-main.png** - Repository GitHub (branche main)
   - Aller sur https://github.com/Admiralphp/cv
   - Capturer la page principale du repository

4. **04-github-repo-dev.png** - Repository GitHub (branche dev)
   - Cliquer sur le sélecteur de branches et choisir "dev"
   - Capturer la vue de la branche dev

5. **05-git-commits.png** - Historique des commits
   - Sur GitHub, aller dans l'onglet "Commits"
   - Capturer la liste des commits

6. **06-github-pages-config.png** - Configuration GitHub Pages
   - Aller dans Settings > Pages
   - Capturer la configuration de GitHub Pages

### 2️⃣ Docker (6 captures)

7. **07-docker-build.png** - Construction de l'image
   ```powershell
   docker build -t cv-mohamed-essid .
   ```
   - Capturer la sortie de la commande build

8. **08-docker-images.png** - Liste des images
   ```powershell
   docker images | Select-String "cv"
   ```
   - Capturer la liste des images Docker créées

9. **09-docker-push.png** - Push vers Docker Hub
   ```powershell
   docker push mohamedessid/cv:v1
   ```
   - Capturer le processus de push

10. **10-dockerhub-repo.png** - Repository Docker Hub
    - Aller sur https://hub.docker.com/r/mohamedessid/cv
    - Capturer la page du repository

11. **11-docker-compose-up.png** - Docker Compose
    ```powershell
    docker-compose up -d
    docker-compose ps
    ```
    - Capturer le résultat du démarrage

12. **12-docker-ps.png** - Conteneurs en cours
    ```powershell
    docker ps
    ```
    - Capturer la liste des conteneurs actifs

### 3️⃣ Application (4 captures)

13. **13-cv-localhost-8005.png** - CV sur localhost
    - Ouvrir http://localhost:8005 dans le navigateur
    - Capturer la page complète du CV

14. **14-cv-github-pages.png** - CV sur GitHub Pages
    - Ouvrir https://admiralphp.github.io/cv/cv-mohamed-essid.html
    - Capturer la page (une fois GitHub Pages activé)

15. **15-docker-desktop.png** - Docker Desktop
    - Ouvrir Docker Desktop
    - Onglet "Containers"
    - Capturer la vue montrant le conteneur cv-mohamed-essid

16. **16-vscode-project.png** - Structure du projet
    - Ouvrir VS Code avec le projet
    - Capturer l'explorateur de fichiers montrant la structure

---

## 🔧 Méthode 1 : Modifier le HTML Manuellement

### Étapes :

1. **Prendre toutes les captures d'écran** selon la liste ci-dessus
2. **Les enregistrer** dans le dossier `screenshots/` avec les noms indiqués
3. **Ouvrir** `compte-rendu-tp.html` dans un éditeur de texte
4. **Remplacer** chaque bloc `<div class="screenshot-placeholder">` par une balise `<img>`

### Exemple de remplacement :

**Avant :**
```html
<div class="screenshot-item">
    <div class="screenshot-placeholder">📷</div>
    <div class="screenshot-caption">1. Initialisation Git et premier commit</div>
</div>
```

**Après :**
```html
<div class="screenshot-item">
    <img src="screenshots/01-git-init.png" alt="Initialisation Git">
    <div class="screenshot-caption">1. Initialisation Git et premier commit</div>
</div>
```

### Liste complète des remplacements :

```html
<!-- Section Git & GitHub -->
<img src="screenshots/01-git-init.png" alt="Git Init">
<img src="screenshots/02-git-branch-dev.png" alt="Branche Dev">
<img src="screenshots/03-github-repo-main.png" alt="GitHub Main">
<img src="screenshots/04-github-repo-dev.png" alt="GitHub Dev">
<img src="screenshots/05-git-commits.png" alt="Commits">
<img src="screenshots/06-github-pages-config.png" alt="GitHub Pages">

<!-- Section Docker -->
<img src="screenshots/07-docker-build.png" alt="Docker Build">
<img src="screenshots/08-docker-images.png" alt="Docker Images">
<img src="screenshots/09-docker-push.png" alt="Docker Push">
<img src="screenshots/10-dockerhub-repo.png" alt="Docker Hub">
<img src="screenshots/11-docker-compose-up.png" alt="Docker Compose">
<img src="screenshots/12-docker-ps.png" alt="Docker PS">

<!-- Section Application -->
<img src="screenshots/13-cv-localhost-8005.png" alt="CV Localhost">
<img src="screenshots/14-cv-github-pages.png" alt="CV GitHub Pages">
<img src="screenshots/15-docker-desktop.png" alt="Docker Desktop">
<img src="screenshots/16-vscode-project.png" alt="VS Code">
```

---

## 🚀 Méthode 2 : Utiliser un Script PowerShell

Créez un fichier `add-screenshots.ps1` :

```powershell
# Script pour vérifier les captures d'écran

$screenshots = @(
    "01-git-init.png",
    "02-git-branch-dev.png",
    "03-github-repo-main.png",
    "04-github-repo-dev.png",
    "05-git-commits.png",
    "06-github-pages-config.png",
    "07-docker-build.png",
    "08-docker-images.png",
    "09-docker-push.png",
    "10-dockerhub-repo.png",
    "11-docker-compose-up.png",
    "12-docker-ps.png",
    "13-cv-localhost-8005.png",
    "14-cv-github-pages.png",
    "15-docker-desktop.png",
    "16-vscode-project.png"
)

Write-Host "Vérification des captures d'écran..." -ForegroundColor Cyan
Write-Host ""

$missing = @()
$found = @()

foreach ($screenshot in $screenshots) {
    $path = "screenshots\$screenshot"
    if (Test-Path $path) {
        Write-Host "✅ $screenshot" -ForegroundColor Green
        $found += $screenshot
    } else {
        Write-Host "❌ $screenshot (manquant)" -ForegroundColor Red
        $missing += $screenshot
    }
}

Write-Host ""
Write-Host "Résumé:" -ForegroundColor Yellow
Write-Host "  Trouvées: $($found.Count)/$($screenshots.Count)" -ForegroundColor Green
Write-Host "  Manquantes: $($missing.Count)/$($screenshots.Count)" -ForegroundColor Red

if ($missing.Count -eq 0) {
    Write-Host ""
    Write-Host "🎉 Toutes les captures sont présentes!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Captures manquantes:" -ForegroundColor Red
    foreach ($m in $missing) {
        Write-Host "  - $m" -ForegroundColor Red
    }
}
```

Exécutez :
```powershell
.\add-screenshots.ps1
```

---

## 📝 Conseils pour de Bonnes Captures

### Qualité
- **Résolution** : Minimum 1920x1080
- **Format** : PNG (meilleure qualité) ou JPG
- **Lisibilité** : Assurez-vous que le texte est lisible

### Contenu
- **Complet** : Capturez toute la fenêtre ou section importante
- **Propre** : Fermez les onglets/fenêtres non pertinents
- **Contexte** : Incluez les éléments qui donnent du contexte (barre d'adresse, titre de fenêtre, etc.)

### Outils recommandés
- **Windows** : 
  - `Win + Shift + S` (Outil capture d'écran)
  - Snipping Tool
  - ShareX (gratuit, avancé)
- **Extensions navigateur** :
  - Awesome Screenshot
  - FireShot

---

## 🎨 Personnalisation du Rapport

### Changer les couleurs

Dans le fichier HTML, modifiez les couleurs dans la section `<style>` :

```css
/* Dégradé principal */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* Changez par : */
background: linear-gradient(135deg, #1e40af 0%, #0ea5e9 100%);
```

### Ajouter votre photo

Dans la section header, ajoutez :

```html
<img src="photos/profil.jpg" alt="Photo de profil" style="width: 150px; height: 150px; border-radius: 50%; border: 4px solid white; margin-bottom: 1rem;">
```

---

## ✅ Checklist Finale

Avant de rendre le compte rendu, vérifiez :

- [ ] Toutes les 16 captures d'écran sont prises
- [ ] Les captures sont enregistrées dans `screenshots/`
- [ ] Le fichier HTML est modifié avec les bonnes références
- [ ] Le rapport s'ouvre correctement dans le navigateur
- [ ] Toutes les images s'affichent
- [ ] Les liens vers GitHub et Docker Hub fonctionnent
- [ ] Le rapport est lisible et professionnel
- [ ] Les informations personnelles sont correctes

---

## 🖨️ Impression ou Export PDF

### Option 1 : Impression navigateur
1. Ouvrir `compte-rendu-tp.html` dans le navigateur
2. `Ctrl + P` (Imprimer)
3. Destination : "Enregistrer au format PDF"
4. Cliquer sur "Enregistrer"

### Option 2 : Chrome Developer Tools
1. Ouvrir le navigateur Chrome
2. `F12` pour ouvrir les Developer Tools
3. `Ctrl + Shift + P`
4. Taper "PDF" et sélectionner "Print to PDF"

---

## 📤 Rendu du TP

Pour rendre le TP, incluez :

1. ✅ **compte-rendu-tp.html** (avec captures intégrées)
2. ✅ **screenshots/** (dossier avec toutes les captures)
3. ✅ **cv-mohamed-essid.html** (le CV)
4. ✅ **Dockerfile**
5. ✅ **docker-compose.yml**
6. ✅ **README.md**

Ou créez une archive :
```powershell
Compress-Archive -Path * -DestinationPath "TP-CICD-Mohamed-Essid.zip"
```

---

## 🆘 Besoin d'Aide ?

Si vous rencontrez des problèmes :
1. Vérifiez que le dossier `screenshots/` existe
2. Vérifiez les noms des fichiers (sensible à la casse)
3. Assurez-vous que les chemins relatifs sont corrects
4. Testez le HTML dans différents navigateurs

---

**Bon courage pour finaliser votre compte rendu ! 🚀**
