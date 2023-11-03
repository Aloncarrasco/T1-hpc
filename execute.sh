#!/bin/bash
#SBATCH --job-name=hpc_t1_klempau       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o ex.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o fa$
#SBATCH --mail-user=cristian.carrasco@uc.cl       # mail donde mandar las notifica$
#SBATCH --workdir=/home/cristian.carrasco/IIC3533-T1         # direccion del d$
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=1        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=32          # numero de cpus (threads) por trabajo (proceso)

echo '--------------------------- Tarea 1 executions --------------------------------'

file='extinguishing_omp.c'
file_bin=$file.bin

gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin



for i in {1..3..1}; do
  echo ''
  echo 'total threads: '$i
  export OMP_NUM_THREADS=$i
  srun -n 1 -c $i $file_bin -f test_files/test4 --nodelist="hydra"
done

for i in {4..32..4}; do
  echo ''
  echo 'total threads: '$i
  export OMP_NUM_THREADS=$i
  srun -n 1 -c $i $file_bin -f test_files/test4 --nodelist="hydra"
done


sleep 5
echo "Finished with job $SLURM_JOBID"