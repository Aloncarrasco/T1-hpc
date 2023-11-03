El archivo de simulación secuencial es: `extinguishing.c`, con el binario `extinguishing`.
El archivo de simulación paralelizado es: `extinguishing_omp.c`, con el binario `extinguishing_omp`.

Para ejecutar la simulación paralelizada, con slurm y una amplia cantidad de threads, basta con ejecutar:
`sbatch ./execute.sh`

En caso de querer modificar el archivo de test usado o la configuración de threads, basta con modificar dicho archivo.

En las carpetas `versions*/` se encuentran distintas pruebas de concepto que utilizamos, hasta encontrar la óptima
configuración para paralelización.