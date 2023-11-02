#!/bin/bash
#SBATCH --job-name=hpc_t1_klempau       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o 8_task_2_cpu.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o fa$
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notifica$
#SBATCH --workdir=/home/cristian.carrasco/T1-hpc         # direccion del d$
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=8        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=2          # numero de cpus (threads) por trabajo (proceso)



echo '--------------------------- Test 4 --------------------------------'
echo '8 tasks'
echo '2 cpu'
echo ''

file='versions_2/parallel_all_but_5.c'
file_bin=$file.bin
echo 'test 3'


gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin

echo 'no exports'
time $file_bin -f test_files/test3


sleep 5
echo "Finished with job $SLURM_JOBID"