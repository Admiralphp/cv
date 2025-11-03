# Scripts PowerShell Utiles pour le TP CI/CD

## Script 1 : Build et Test Local

```powershell
# build-and-test.ps1

Write-Host "🔨 Construction de l'image Docker..." -ForegroundColor Cyan
docker build -t cv-mohamed-essid .

Write-Host "✅ Image créée avec succès!" -ForegroundColor Green
docker images | Select-String "cv-mohamed-essid"

Write-Host "🧪 Lancement d'un test sur le port 8080..." -ForegroundColor Cyan
docker run -d -p 8080:80 --name cv-test cv-mohamed-essid

Write-Host "⏳ Attendre 2 secondes..." -ForegroundColor Yellow
Start-Sleep -Seconds 2

Write-Host "🌐 Test de l'accès HTTP..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing
    Write-Host "✅ Le CV est accessible! Status: $($response.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "❌ Erreur lors du test: $_" -ForegroundColor Red
}

Write-Host "🧹 Nettoyage du conteneur de test..." -ForegroundColor Cyan
docker stop cv-test
docker rm cv-test

Write-Host "✨ Test terminé!" -ForegroundColor Green
```

## Script 2 : Tag et Push vers Docker Hub

```powershell
# push-to-dockerhub.ps1

param(
    [Parameter(Mandatory=$true)]
    [string]$DockerHubUsername
)

Write-Host "🏷️  Création du tag..." -ForegroundColor Cyan
docker tag cv-mohamed-essid "${DockerHubUsername}/cv:v1"

Write-Host "🔐 Connexion à Docker Hub..." -ForegroundColor Cyan
docker login

Write-Host "📤 Push de l'image vers Docker Hub..." -ForegroundColor Cyan
docker push "${DockerHubUsername}/cv:v1"

Write-Host "✅ Image poussée avec succès!" -ForegroundColor Green
Write-Host "🌐 Voir sur: https://hub.docker.com/r/${DockerHubUsername}/cv" -ForegroundColor Yellow
```

Usage:
```powershell
.\push-to-dockerhub.ps1 -DockerHubUsername "VOTRE_USERNAME"
```

## Script 3 : Déploiement avec Docker Compose

```powershell
# deploy.ps1

param(
    [Parameter(Mandatory=$true)]
    [string]$DockerHubUsername
)

# Créer le fichier .env
Write-Host "📝 Création du fichier .env..." -ForegroundColor Cyan
"DOCKER_USERNAME=$DockerHubUsername" | Out-File -FilePath .env -Encoding UTF8

# Arrêter les conteneurs existants
Write-Host "🛑 Arrêt des conteneurs existants..." -ForegroundColor Cyan
docker-compose down 2>$null

# Démarrer le stack
Write-Host "🚀 Démarrage du stack Docker Compose..." -ForegroundColor Cyan
docker-compose up -d

# Attendre que le conteneur démarre
Write-Host "⏳ Attendre 3 secondes..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

# Vérifier le statut
Write-Host "📊 Statut des conteneurs:" -ForegroundColor Cyan
docker-compose ps

# Tester l'accès
Write-Host "🧪 Test de l'accès sur localhost:8005..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8005" -UseBasicParsing
    Write-Host "✅ Le CV est accessible! Status: $($response.StatusCode)" -ForegroundColor Green
    Write-Host "🌐 Ouvrir dans le navigateur: http://localhost:8005" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erreur lors du test: $_" -ForegroundColor Red
}

Write-Host "✨ Déploiement terminé!" -ForegroundColor Green
```

Usage:
```powershell
.\deploy.ps1 -DockerHubUsername "VOTRE_USERNAME"
```

## Script 4 : Push vers GitHub

```powershell
# push-to-github.ps1

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername
)

Write-Host "🔧 Configuration du remote GitHub..." -ForegroundColor Cyan
git remote remove origin 2>$null
git remote add origin "https://github.com/${GitHubUsername}/${GitHubUsername}.github.io.git"

Write-Host "📝 Renommage de la branche en main..." -ForegroundColor Cyan
git branch -M main

Write-Host "📤 Push de la branche main..." -ForegroundColor Cyan
git push -u origin main

Write-Host "🌿 Basculement sur dev et push..." -ForegroundColor Cyan
git checkout -b dev 2>$null
git push -u origin dev

Write-Host "🔙 Retour sur main..." -ForegroundColor Cyan
git checkout main

Write-Host "✅ Push terminé!" -ForegroundColor Green
Write-Host "🌐 Repository: https://github.com/${GitHubUsername}/${GitHubUsername}.github.io" -ForegroundColor Yellow
Write-Host "🌐 GitHub Pages: https://${GitHubUsername}.github.io/cv-mohamed-essid.html" -ForegroundColor Yellow
Write-Host "" -ForegroundColor White
Write-Host "⚠️  N'oubliez pas d'activer GitHub Pages dans Settings > Pages" -ForegroundColor Yellow
```

Usage:
```powershell
.\push-to-github.ps1 -GitHubUsername "VOTRE_USERNAME"
```

## Script 5 : Nettoyage Complet

```powershell
# cleanup.ps1

Write-Host "🧹 Nettoyage complet..." -ForegroundColor Cyan

Write-Host "🛑 Arrêt de Docker Compose..." -ForegroundColor Yellow
docker-compose down

Write-Host "🗑️  Suppression des conteneurs..." -ForegroundColor Yellow
docker ps -a | Select-String "cv" | ForEach-Object {
    $containerId = ($_ -split '\s+')[0]
    docker rm -f $containerId 2>$null
}

Write-Host "🗑️  Suppression des images locales..." -ForegroundColor Yellow
docker images | Select-String "cv" | ForEach-Object {
    $imageId = ($_ -split '\s+')[2]
    docker rmi -f $imageId 2>$null
}

Write-Host "🗑️  Suppression du fichier .env..." -ForegroundColor Yellow
Remove-Item -Path .env -ErrorAction SilentlyContinue

Write-Host "✅ Nettoyage terminé!" -ForegroundColor Green
```

## Script 6 : Workflow Complet

```powershell
# full-workflow.ps1

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername,
    
    [Parameter(Mandatory=$true)]
    [string]$DockerHubUsername
)

Write-Host "🚀 Workflow Complet CI/CD" -ForegroundColor Magenta
Write-Host "================================" -ForegroundColor Magenta
Write-Host ""

# Étape 1 : Git
Write-Host "📝 Étape 1 : Vérification Git" -ForegroundColor Cyan
git status

# Étape 2 : Build Docker
Write-Host ""
Write-Host "🔨 Étape 2 : Build Docker" -ForegroundColor Cyan
docker build -t cv-mohamed-essid .

# Étape 3 : Test local
Write-Host ""
Write-Host "🧪 Étape 3 : Test local" -ForegroundColor Cyan
docker run -d -p 8080:80 --name cv-test cv-mohamed-essid
Start-Sleep -Seconds 2
Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing | Out-Null
Write-Host "✅ Test local réussi!" -ForegroundColor Green
docker stop cv-test
docker rm cv-test

# Étape 4 : Tag
Write-Host ""
Write-Host "🏷️  Étape 4 : Tag de l'image" -ForegroundColor Cyan
docker tag cv-mohamed-essid "${DockerHubUsername}/cv:v1"

# Étape 5 : Push Docker Hub
Write-Host ""
Write-Host "📤 Étape 5 : Push vers Docker Hub" -ForegroundColor Cyan
docker push "${DockerHubUsername}/cv:v1"

# Étape 6 : Deploy avec Docker Compose
Write-Host ""
Write-Host "🚀 Étape 6 : Déploiement Docker Compose" -ForegroundColor Cyan
"DOCKER_USERNAME=$DockerHubUsername" | Out-File -FilePath .env -Encoding UTF8
docker-compose down 2>$null
docker-compose up -d
Start-Sleep -Seconds 3

# Étape 7 : Vérification finale
Write-Host ""
Write-Host "✅ Étape 7 : Vérification finale" -ForegroundColor Cyan
docker-compose ps
Invoke-WebRequest -Uri "http://localhost:8005" -UseBasicParsing | Out-Null

Write-Host ""
Write-Host "🎉 Workflow terminé avec succès!" -ForegroundColor Green
Write-Host ""
Write-Host "📌 URLs importantes:" -ForegroundColor Yellow
Write-Host "  🌐 Local: http://localhost:8005" -ForegroundColor White
Write-Host "  🌐 GitHub Pages: https://${GitHubUsername}.github.io/cv-mohamed-essid.html" -ForegroundColor White
Write-Host "  🌐 Docker Hub: https://hub.docker.com/r/${DockerHubUsername}/cv" -ForegroundColor White
```

Usage:
```powershell
.\full-workflow.ps1 -GitHubUsername "VOTRE_GITHUB_USERNAME" -DockerHubUsername "VOTRE_DOCKERHUB_USERNAME"
```

## 📝 Notes d'Utilisation

### Exécution des Scripts

1. Ouvrir PowerShell dans le dossier du projet
2. Si nécessaire, autoriser l'exécution de scripts :
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
3. Exécuter le script souhaité

### Ordre Recommandé

1. `build-and-test.ps1` - Tester localement
2. `push-to-dockerhub.ps1` - Publier sur Docker Hub
3. `deploy.ps1` - Déployer avec Docker Compose
4. `push-to-github.ps1` - Pousser sur GitHub

Ou utiliser directement `full-workflow.ps1` pour tout exécuter en une fois !

---

**⚠️ Important** : Ces scripts sont fournis à titre d'exemple. Vous pouvez les adapter selon vos besoins.
