# Cool Code

This a repository where I save cool codes I've created to the different classes I took. I'll list them in here, and I'll upload them as soon as I go finding files in my computer...
Peace!

## Convierte DVD a MP4
Codigo de Powershell para convertir los archivos de DVD con formato .VOB a .MP4 mediante [FFmpeg](https://ffmpeg.org/documentation.html), un multimedia framework. \\
Este código convierte recursivamente los archivos .VOB de la carpeta Videos. Los archivos entregados se encuentran en la misma ubicación de los archivos y con el mismo nombre a diferencia de la extension.

```
ls -Recurse '.\Videos' | Where { $_.Extension -eq ".VOB" } | ForEach { .\ffmpeg -i $_.FullName $_.FullName.Replace(".VOB", ".mp4") }
```


## Floating point arithmetic representation in MatLab

[(Tarea.m)]
I wrote this code for a computer class. The code runs on Matlab and given a number, using floating point arithmetic, if the numer can be represented, then it'll tell you how, and finally it'll show the Gray representation.
