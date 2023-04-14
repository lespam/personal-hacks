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


