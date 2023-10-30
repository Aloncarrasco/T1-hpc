#!/bin/bash
#SBATCH --job-name=hello_world       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o c_job.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o falle
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notificaciones
#SBATCH --workdir=/user/cristian.carrasco/T1-hpc        # direccion del directorio de trabajo
#
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=4        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=4            # numero de cpus (threads) por trabajo (proceso)

./extinguishing_omp_1 -f test_files/test2

#SBATCH --nodes 2                    # numero de nodos a usar
#SBATCH --ntasks-per-node=4        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=4            # numero de cpus (threads) por trabajo (proceso)
./extinguishing_omp_1 -f test_files/test2

#SBATCH --nodes 4                    # numero de nodos a usar
#SBATCH --ntasks-per-node=4        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=4            # numero de cpus (threads) por trabajo (proceso)
./extinguishing_omp_1 -f test_files/test2

sleep 10
echo "Finished with job $SLURM_JOBID"
