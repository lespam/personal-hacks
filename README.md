# Shortcodes y hacks personales

En este repositorio estoy juntando los pedazos de codigo que utilizo en mi día a día y en mis proyectos personales. Puede ser código que usé una vez para un caso especifico pero quisiewra resguardar y compartir las soluciones que encuentre. El codigo es de distintos programas y lenguajes, puede ser una configuracion de regex en powershell o un archivo con un programa matemático de Matlab.

Peace out!

Convierte DVD a MP4 usando FFmpeg
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
Get-ChildItem -Path $(Get-Location) -Recurse -Directory | Where-Object { $_.GetFileSystemInfos().Count -eq 0 } | Remove-Item -WhatIf -Force
```
Si estas seguro que quieres borrar, elimina el `-WhatIf`.

Borra los archivos ocultos que comienzan con un punto en PowerShell
---
1. Revisar archivos a eliminar
```
Get-ChildItem -Recurse -Force | Where-Object { $_.Name -match "^\." }
```
El resultado es algo como
```
  Directory: C:\Users\L\Documentos\THE BEST HITS OF THE 70s\Covers

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a-h--        12/13/2013  10:06 PM           4096 ._VA - The Best Hits of 70'_Back.jpg
-a-h--        12/13/2013  10:06 PM           4096 ._VA - The Best Hits of 70'_CD.jpg
-a-h--        12/13/2013  10:06 PM           4096 ._VA - The Best Hits of 70'_Front.jpg
```

2. Eliminar
```
Get-ChildItem -Recurse -Force | Where-Object { $_.Name -match "^\." } | Remove-Item -Force
Get-ChildItem -Recurse -Force | Where-Object { $_.Name -match "*.db" } | Remove-Item -Force
```

Borra los folders vacíos en PowerShell
---
1. Ver folders a borrar
```
Get-ChildItem -Recurse -Path $srcPath -Directory | Where-Object { (Get-ChildItem $_.FullName -Force).Count -eq 0 }
```
2. Borrar
```
Get-ChildItem -Recurse -Path $srcPath -Directory | Where-Object { (Get-ChildItem $_.FullName -Force).Count -eq 0 } | Remove-Item -Force
```
How to strip the last N characters of a filename
---
To split the last 33 characters from filenames in a directory using PowerShell, you can follow these steps:
1. **Get the List of Files:** First, use the `Get-ChildItem` cmdlet to retrieve the list of files in the directory. For example:
```powershell
$files = Get-ChildItem -Path "C:\Your\Directory\Path"
```

2. **Rename the Files:** Next, iterate through each file and rename it by removing the last 33 characters. You can use the `.substring()` method to achieve this. Here’s an example:
```powershell
foreach ($file in $files) {
    $newName = $file.Name.Substring(0, $file.Name.Length - 33)
    Rename-Item -Path $file.FullName -NewName $newName
}
```

How to add the extension to files in a directory
---

This command retrieves all files in the current directory and renames them by appending the `.md` extension.
```powershell
Get-ChildItem -File | Rename-Item -NewName {$_.Name + ".md"}
```


How to create a GIF from a folder using Magick
---
Magick es un software open source para manipular imagenes a traves de la terminal.
Este código se encarga de crear un GIF a partir de una carpeta de imágenes. El comando se ejecuta desde la carpeta en cuestión.
```powershell
magick convert -delay 10 -loop 0 *.jpg vahshirrockstars.gif
```
How to resize images from the Command Line
---
Using Magick.
My first attempt
```sh
magick ds_logo_full_white.png -resize 800x800 ds_logo_full_white_800x800.png
```
> adapt my command line to meet this requirements: Accepted file formats are PNG and JPEG. File must be less than 5 MB, and must be at least 576 by 576 pixels. Recommended size is 800 by 800 pixels

Try this modified command:
```sh
magick ds_logo_full_white.png -resize 800x800^ -gravity center -extent 800x800 -format png -strip ds_logo_full_white_800x800.png
```
**What this does:**
- **`-resize 800x800^`** → Ensures the image scales to at least **800x800**, maintaining aspect ratio.
- **`-gravity center -extent 800x800`** → If the image is smaller than **800x800**, it fills the remaining space by extending the canvas.
- **`-format png -strip`** → Saves it as a **PNG** while stripping unnecessary metadata (to keep file size down).

Creating backgrounds (rendering from the terminal)
---
Image Magick has that capability to render stuff...
> can magick create a background image?
> create a nice background for Dollar Scholars. Accepted file formats are PNG and JPEG. File must be less than 5 MB, and must be at least 576 by 576 pixels. Recommended size is 800 by 800 pixels with the terminal command

```sh
magick -size 800x800 gradient:#0A662A-#9EE067 -gravity center -extent 800x800 -format png -strip background_dollar_scholars.png
```

**What this does:**
- **Creates an 800x800 image** → Meets website requirements.
- **Uses a gradient from dark green (`#0A662A`) to bright money green (`#9EE067`)** → Represents **wealth & success**.
- **Centers and extends the image** to ensure proper framing.
- **Saves as PNG** and removes metadata to keep the file size optimized.

Start guinicorn in a virtual environment to run django locally
---
Add security key

```
echo "export SECRET_KEY='$(openssl rand -hex 40)'" > .DJANGO_SECRET_KEY
```

```
source .DJANGO_SECRET_KEY
```

```
cat .DJANGO_SECRET_KEY
```

Start virtual environment
```
source ~/env/bin/activate
```

Kill previous gunicorn process if existent
```
sudo killall gunicorn
```

Make sure log file exists for the values in the gunicorn config file

```
sudo mkdir -pv /var/{log,run}/gunicorn/
```
```
sudo chown -cR ubuntu:ubuntu /var/{log,run}/gunicorn/
```

Start gunicorn
```
gunicorn -c config/gunicorn/dev.py
```

See the gunicorn logfile for dev
```
tail -f /var/log/gunicorn/dev.log
```

Python Dictionaries
---


``` python
>>> a = dict(one=1, two=2, three=3)
>>> b = {'one': 1, 'two': 2, 'three': 3}
>>> 
>>> c = dict(zip(['one', 'two', 'three'], [1, 2, 3]))
>>> 
>>> d = dict([('two', 2), ('one', 1), ('three', 3)])
>>> e = dict({'three': 3, 'one': 1, 'two': 2})
>>> 
>>> f = dict({'one': 1, 'three': 3}, two=2)
>>
>>
>>> a == b == c == d == e == f
True
```

Using XLS in Pandas
---
See https://pandas.pydata.org/docs/getting_started/comparison/comparison_with_spreadsheets.html#data-structures
