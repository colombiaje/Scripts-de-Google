
# Ruta local donde guardarás los scripts
$basePath = "C:\Mega\Scripts"

# Lista de IDs de proyectos
$scriptList = @(
    @{ Name = "Script1"; ID = "17YRUCLA-a7wrh3EDh-iNaN9QWv3-yiWX8ZvQVsv8y0FftLIOVEAjC-Jv" },
    @{ Name = "Script2"; ID = "1FKw7f9fy42x71JB6ZU_v8UeIM5rs6AJclalz09BwdDLFpQgAK5f4HQ94" },
    @{ Name = "Script3"; ID = "1vBpu7IRuY1z2Vg8YfnbibesK1YAxb2rfGBvTUmn6YOZkby4tIgKADos1" }
)

# Cambia al directorio base
Set-Location -Path $basePath

# Recorre cada proyecto
foreach ($script in $scriptList) {
    $folderPath = Join-Path $basePath $script.Name

    # Si ya existe, eliminar para evitar conflictos (opcional)
    if (Test-Path $folderPath) {
        Remove-Item -Recurse -Force $folderPath
    }

    # Clonar el script con CLASP
    mkdir $folderPath | Out-Null
    Set-Location -Path $folderPath
    clasp clone $script.ID
    Set-Location -Path $basePath
}

# Confirmar cambios en Git y hacer push
git add .
git commit -m "Backup automatizado de scripts Google Apps Script 2025 05 08"
git push origin main
