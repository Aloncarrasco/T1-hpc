#!/bin/bash
#SBATCH --job-name=hpc_t1_klempau       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o ex.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o fa$
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notifica$
#SBATCH --workdir=/home/cristian.carrasco/T1-hpc         # direccion del d$
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=2        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=16          # numero de cpus (threads) por trabajo (proceso)

echo '--------------------------- Test 4 --------------------------------'
echo '1 tasks'
echo '16 cpu'
echo ''

file='versions_2/parallel_all_but_5.c'
file_bin=$file.bin


gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin

echo 'no exports'

srun $file_bin -f test_files/test4
srun $file_bin -f test_files/test3




sleep 5
echo "Finished with job $SLURM_JOBID"