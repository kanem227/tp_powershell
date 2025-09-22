# 🗂️ Script PowerShell de Sauvegarde Automatique

## 📌 Description
Ce script PowerShell permet d’automatiser la sauvegarde de fichiers et dossiers.  
Il demande à l’utilisateur une liste de chemins à sauvegarder, crée un dossier de sauvegarde daté, copie les fichiers, puis génère un rapport **CSV** contenant les métadonnées.  

---

## ✨ Fonctionnalités
- ✅ Demande des chemins de fichiers ou dossiers à sauvegarder  
- ✅ Crée un dossier de sauvegarde avec horodatage (`Backup_yyyy-MM-dd_HHmm`)  
- ✅ Copie récursivement les fichiers dans le dossier de sauvegarde  
- ✅ Génère un rapport `CSV` contenant :  
  - Nom du fichier  
  - Taille (en octets)  
  - Date de création  
  - Chemin source  

---

## ⚙️ Paramètres
- **`sourcePaths`** : chemins des fichiers/dossiers à sauvegarder (séparés par des virgules)  
- **`destRoot`** : répertoire racine où sera créé le dossier de sauvegarde  

---

## 🚀 Exemple d’utilisation
```powershell
PS> .\autoSave.ps1
Entrez les chemins des dossiers/fichiers à sauvegarder (séparés par des virgules): C:\Users\Kanem\Documents,C:\Users\Kanem\Pictures
Entrez le chemin du dossier de sauvegarde (ex: D:\Backups): D:\Sauvegardes
