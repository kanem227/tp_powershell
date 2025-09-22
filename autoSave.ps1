<#
.SYNOPSIS
    Script de sauvegarde automatique de fichiers et dossiers.

.DESCRIPTION
    Ce script PowerShell permet de :
      - Demander à l’utilisateur une liste de fichiers ou dossiers à sauvegarder
      - Créer un dossier de sauvegarde daté
      - Copier les fichiers dans ce dossier
      - Générer un rapport CSV contenant les métadonnées (nom, taille, date, chemin source)

.PARAMETER sourcePaths
    Chemins des fichiers ou dossiers à sauvegarder (séparés par des virgules).

.PARAMETER destRoot
    Chemin du répertoire racine où sera créé le dossier de sauvegarde.

.EXAMPLE
    PS> .\autoSave.ps1
    Entrez les chemins des dossiers/fichiers à sauvegarder (séparés par des virgules): C:\Users\Kanem\Documents,C:\Users\Kanem\Pictures
    Entrez le chemin du dossier de sauvegarde (ex: D:\Backups): D:\Sauvegardes

    → Crée un dossier D:\Sauvegardes\Backup_2025-09-21_1412
    → Copie les fichiers dedans
    → Génère un rapport CSV avec les détails.

.NOTES
    Auteur  : Kanem227
    Version : 1.0
    Date    : 21/09/2025
#>


# -----------------------------
# VARIABLES
# -----------------------------
$sourcePaths = Read-Host "Entrez les chemins des dossiers/fichiers à sauvegarder (séparés par des virgules)"
$destRoot = Read-Host "Entrez le chemin du dossier de sauvegarde (ex: D:\Backups)"

# Conversion en tableau
$paths = $sourcePaths -split ',' | ForEach-Object { $_.Trim() }

# Créer un dossier de sauvegarde daté
$date = Get-Date -Format "yyyy-MM-dd_HHmm"
$backupDir = Join-Path $destRoot "Backup_$date"
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null

Write-Output "📂 Sauvegarde en cours vers : $backupDir"

# -----------------------------
# SAUVEGARDE
# -----------------------------
$report = @()

foreach ($p in $paths) {
    if (Test-Path $p) {
        Copy-Item -Path $p -Destination $backupDir -Recurse -Force
        $files = Get-ChildItem $p -Recurse -File
        foreach ($f in $files) {
            $report += [PSCustomObject]@{
                Nom          = $f.Name
                Taille       = $f.Length
                DateCreation = $f.CreationTime
                Source       = $f.FullName
            }
        }
        Write-Output "✅ $p sauvegardé"
    } else {
        Write-Output "⚠️ Chemin introuvable : $p"
    }
}

# -----------------------------
# RAPPORT CSV
# -----------------------------
$csvPath = "$backupDir\rapport_sauvegarde.csv"
$report | Export-Csv $csvPath -NoTypeInformation
Write-Output "📑 Rapport généré : $csvPath"

Write-Output "🎉 Sauvegarde terminée avec succès !"