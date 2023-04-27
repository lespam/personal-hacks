# Compilación de shortcodes y hacks personales

En este repositorio estoy juntando los pedazos de codigo que utilizo en mi día a día y en mis proyectos personales. Puede ser código que usé una vez para un caso especifico pero quisiewra resguardar y compartir las soluciones que encuentre. El codigo es de distintos programas y lenguajes, puede ser una configuracion de regex en powershell o un archivo con un programa matemático de Matlab.

Peace out!

Convierte DVD a MP4
---
Codigo de Powershell para convertir los archivos de DVD con formato .VOB a .MP4 mediante [FFmpeg](https://ffmpeg.org/documentation.html), un multimedia framework.


Este código convierte recursivamente los archivos .VOB de la carpeta Videos. Los archivos entregados se encuentran en la misma ubicación de los archivos y con el mismo nombre a diferencia de la extension.

`
ls -Recurse '.\Videos' | Where { $_.Extension -eq ".VOB" } | ForEach { .\ffmpeg -i $_.FullName $_.FullName.Replace(".VOB", ".mp4") }
`



Floating point arithmetic representation in MatLab
---
[Tarea.m](https://github.com/lespam/shortcuts/blob/master/tarea.m)
I wrote this code for a computer class. The code runs on Matlab and given a number, using floating point arithmetic, if the numer can be represented, then it'll tell you how, and finally it'll show the Gray representation.



Open the Hardware and Devices Troublshooter on Windows 11
---
`
msdt.exe -id DeviceDiagnostic
`

Find out which process is using the folder using PowerShell
---
```
# Get all processes
$processes = Get-Process

# Loop through each process
foreach ($process in $processes) {
  # Try to get the path of the executable
  try {
    $path = $process.Path
  }
  catch {
    # Ignore any errors
    continue
  }

  # Check if the path contains the folder name
  if ($path -like "*Music*") {
    # Write the process name and path
    Write-Host "$($process.Name) - $path"
  }
}
```

This will output something like:
```
Spotify - C:\Users\lesli\AppData\Roaming\Spotify\Spotify.exe
iTunes - C:\Program Files\iTunes\iTunes.exe
```

Borra las carpetas vacias recursivamente en PowerShell
---

```
do{
    $folders = Get-ChildItem -Path $(Get-Location) -Recurse -Directory | Where-Object { $_.GetFileSystemInfos().Count -eq 0 }
    foreach ($folder in $folders) {
        Remove-Item $folder.FullName -Recurse -Force
	}
    $folders = Get-ChildItem -Path $(Get-Location) -Recurse -Directory | Where-Object { $_.GetFileSystemInfos().Count -eq 0 }
} while ($folders.Count -ne 0)
```
