# === Script PowerShell pour configurer un environnement de développement ultra-complet ===
# Exécutez en mode administrateur

Write-Host "=== Configuration de l'environnement de développement ===" -ForegroundColor Cyan

# === Vérification et Installation de Winget ===
if (-Not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget n'est pas disponible. Voulez-vous l'installer maintenant ?" -ForegroundColor Yellow
    $response = Read-Host "Tapez 'O' pour installer Winget ou 'N' pour quitter"

    if ($response -eq "O") {
        Write-Host "Installation de Winget en cours..." -ForegroundColor Cyan

        # Lien officiel pour installer Winget
        $wingetInstallerUrl = "https://aka.ms/getwinget"

        # Télécharge et installe Winget
        try {
            $installerPath = "$env:TEMP\AppInstaller.exe"
            Invoke-WebRequest -Uri $wingetInstallerUrl -OutFile $installerPath
            Start-Process -FilePath $installerPath -ArgumentList "/quiet" -Wait
            Remove-Item -Path $installerPath -Force

            Write-Host "Winget a été installé avec succès. Veuillez redémarrer le terminal pour continuer." -ForegroundColor Green
            exit
        } catch {
            Write-Host "Échec de l'installation de Winget. Veuillez l'installer manuellement depuis : $wingetInstallerUrl" -ForegroundColor Red
            exit
        }
    } else {
        Write-Host "Script arrêté. Installez Winget et relancez le script." -ForegroundColor Red
        exit
    }
}

Write-Host "Winget est disponible. Début de l'installation..." -ForegroundColor Green

# === Installation des outils essentiels ===
$essentialPackages = @(
    @{ Name = "Git"; Id = "Git.Git" },
    @{ Name = "Visual Studio Code"; Id = "Microsoft.VisualStudioCode" },
    @{ Name = "Windows Terminal"; Id = "Microsoft.WindowsTerminal" },
    @{ Name = "7-Zip"; Id = "7zip.7zip" },
    @{ Name = "Oh My Posh"; Id = "JanDeDobbeleer.OhMyPosh" },
    @{ Name = "Fira Code (Nerd Font)"; Id = "NerdFonts.FiraCode" }
)

foreach ($package in $essentialPackages) {
    Write-Host "`n--- Installation de $($package.Name) ---" -ForegroundColor Cyan
    winget install --id $($package.Id) --silent --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($package.Name) installé avec succès." -ForegroundColor Green
    } else {
        Write-Host "Échec de l'installation de $($package.Name)." -ForegroundColor Red
    }
}

# === Configuration d'Oh My Posh ===
Write-Host "`n--- Configuration d'Oh My Posh ---" -ForegroundColor Cyan
$poshConfigPath = "$env:USERPROFILE\AppData\Local\oh-my-posh\themes"
if (-Not (Test-Path $poshConfigPath)) {
    mkdir $poshConfigPath -Force
}
Invoke-WebRequest -Uri "https://ohmyposh.dev/themes/jandedobbeleer.omp.json" -OutFile "$poshConfigPath\jandedobbeleer.omp.json"
echo 'oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\oh-my-posh\themes\jandedobbeleer.omp.json" | Invoke-Expression' >> $PROFILE
Write-Host "Oh My Posh est configuré avec le thème 'jandedobbeleer'. Redémarrez votre terminal pour appliquer les changements." -ForegroundColor Green

# === Installation des langages et frameworks associés ===
Write-Host "`n--- Installation des langages principaux et frameworks ---" -ForegroundColor Cyan
$programmingLanguagesAndFrameworks = @(
    @{ Name = "Node.js (LTS) + Express"; Id = "OpenJS.NodeJS.LTS"; PostInstall = "npm install -g express-generator" },
    @{ Name = "Python + Flask + Django"; Id = "Python.Python.3"; PostInstall = "pip install flask django" },
    @{ Name = "Ruby + Rails"; Id = "RubyInstallerTeam.RubyWithDevKit"; PostInstall = "gem install rails" },
    @{ Name = "PHP + Laravel"; Id = "PHP.PHP"; PostInstall = "composer global require laravel/installer" },
    @{ Name = "Go + Gin"; Id = "Golang.Go"; PostInstall = "go install github.com/gin-gonic/gin@latest" },
    @{ Name = "Java (AdoptOpenJDK) + Spring Boot CLI"; Id = "AdoptOpenJDK.OpenJDK.17"; PostInstall = "winget install --id Pivotal.SpringBoot" },
    @{ Name = "Rust + Rocket"; Id = "Rustlang.Rust"; PostInstall = "cargo install rocket" }
)

foreach ($item in $programmingLanguagesAndFrameworks) {
    Write-Host "`n--- Installation de $($item.Name) ---" -ForegroundColor Cyan
    winget install --id $($item.Id) --silent --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($item.Name) installé avec succès." -ForegroundColor Green
        if ($item.PostInstall -ne $null) {
            Write-Host "Configuration post-installation pour $($item.Name)..." -ForegroundColor Cyan
            Invoke-Expression $item.PostInstall
        }
    } else {
        Write-Host "Échec de l'installation de $($item.Name)." -ForegroundColor Red
    }
}

# === Installation des outils pour bases de données ===
Write-Host "`n--- Installation des bases de données ---" -ForegroundColor Cyan
$databases = @(
    @{ Name = "MySQL Workbench"; Id = "Oracle.MySQLWorkbench" },
    @{ Name = "PostgreSQL"; Id = "PostgreSQL.PostgreSQL" },
    @{ Name = "SQLite"; Id = "SQLite.SQLite" },
    @{ Name = "MongoDB Compass"; Id = "MongoDB.Compass" }
)

foreach ($db in $databases) {
    Write-Host "`n--- Installation de $($db.Name) ---" -ForegroundColor Cyan
    winget install --id $($db.Id) --silent --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($db.Name) installé avec succès." -ForegroundColor Green
    } else {
        Write-Host "Échec de l'installation de $($db.Name)." -ForegroundColor Red
    }
}

# === Installation des outils pour développement web et UI/UX ===
Write-Host "`n--- Installation des outils pour le développement web ---" -ForegroundColor Cyan
$webTools = @(
    @{ Name = "Postman"; Id = "Postman.Postman" },
    @{ Name = "Insomnia"; Id = "Insomnia.Insomnia" },
    @{ Name = "Figma"; Id = "Figma.Figma" }
)

foreach ($tool in $webTools) {
    Write-Host "`n--- Installation de $($tool.Name) ---" -ForegroundColor Cyan
    winget install --id $($tool.Id) --silent --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($tool.Name) installé avec succès." -ForegroundColor Green
    } else {
        Write-Host "Échec de l'installation de $($tool.Name)." -ForegroundColor Red
    }
}

Write-Host "`n=== Configuration complète ! Redémarrez votre terminal pour finaliser l'installation ===" -ForegroundColor Cyan
