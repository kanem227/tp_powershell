# 🗂️ Script PowerShell de Sauvegarde Automatique

## 📌 Description
Ce script PowerShell permet d’automatiser la sauvegarde de fichiers et dossiers.  
Il exige  à l’utilisateur d'entrer deux paramètres : 
    - -Source   une liste de chemins à sauvegarder
    - -Destination  une destination pour la sauvegarde 
Ainsi il crée un dossier de sauvegarde daté, copie les fichiers, puis génère un rapport **CSV** contenant les métadonnées.  

---

## ✨ Fonctionnalités
- ✅ Crée un dossier de sauvegarde avec horodatage (`Backup_yyyy-MM-dd_HHmm`)  
- ✅ Copie récursivement les fichiers dans le dossier de sauvegarde  
- ✅ Génère un rapport `CSV` contenant :  
  - Nom du fichier  
  - Taille (en octets)  
  - Date de création  
  - Chemin source  

---

## ⚙️ Paramètres
- **`Source`** : chemins des fichiers/dossiers à sauvegarder (séparés par des virgules)  
- **`Destination`** : répertoire racine où sera créé le dossier de sauvegarde
---

## 🚀 Exemple d’utilisation
```powershell
PS> .\autoSave.ps1 -Source "C:\Users\bob\Documents" -Destination "D:\Backups"



Il exige  à l’utilisateur d'entrer deux paramètres : 
    - -Source   une liste de chemins à sauvegarder
    - -Destination  crée un dossier de sauvegarde daté, copie les fichiers, puis génère un rapport **CSV** contenant les métadonnées.  