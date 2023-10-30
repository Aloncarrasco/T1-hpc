#!/bin/bash
#SBATCH --job-name=hello_world       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o c_job.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o falle
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notificaciones
#SBATCH --workdir=/user/cruz/iic3534/slurm         # direccion del directorio de trabajo
#
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=24         # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=1            # numero de cpus (threads) por trabajo (proceso)

./hello
./hello
./hello

sleep 10
echo "Finished with job $SLURM_JOBID"
