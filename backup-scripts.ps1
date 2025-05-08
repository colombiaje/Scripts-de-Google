# Cambiar al directorio base
Set-Location "C:\Mega\Scripts"

# Lista de scripts a respaldar
$scripts = @(
    @{ id = "17YRUCLA-a7wrh3EDh-iNaN9QWv3-yiWX8ZvQVsv8y0FftLIOVEAjC-Jv"; nombre = "Script1-Entrix" },
    @{ id = "1FKw7f9fy42x71JB6ZU_v8UeIM5rs6AJclalz09BwdDLFpQgAK5f4HQ94"; nombre = "Script2-Otros" },
    @{ id = "1vBpu7IRuY1z2Vg8YfnbibesK1YAxb2rfGBvTUmn6YOZkby4tIgKADos1"; nombre = "Script3-Más" }
)

# Recorremos cada script
foreach ($script in $scripts) {
    $carpeta = $script.nombre
    $scriptId = $script.id

    # Crear carpeta si no existe
    if (-not (Test-Path $carpeta)) {
        New-Item -ItemType Directory -Path $carpeta
    }

    Set-Location $carpeta

    # Inicializar el proyecto y vincular con script
    clasp clone $scriptId

    # Subir a GitHub
    git init
    git remote add origin https://github.com/colombiaje/Scripts-de-Google.git
    git checkout -b main

    git add .
    git commit -m "Backup del script $carpeta - $(Get-Date -Format 2025-05-08)"
    git push origin main

    Set-Location ..
}
