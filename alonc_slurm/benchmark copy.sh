#!/bin/bash
#SBATCH --job-name=hpc_t1_klempau       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o c_job.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o fa$
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notifica$
#SBATCH --workdir=/home/cristian.carrasco/T1-hpc         # direccion del d$
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=3        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=2            # numero de cpus (threads) por trabajo (proceso)

echo 'Start'

# gcc -fopenmp -lm -O3 'versions_2/parallel_all.c' -lm -O3 -o 'parallel_all.bin'
# gcc -lm -O3 'extinguishing.c' -lm -O3 -o 'extinguishing.bin'

# echo 'Finished compiling'


# ./parallel_all.bin -f test_files/test1

# ./parallel_all.bin -f test_files/test3





sleep 5
echo "Finished with job $SLURM_JOBID"