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
#SBATCH --cpus-per-task=16          # numero de cpus (threads) por trabajo (proceso)

echo '--------------------------- Test 4 --------------------------------'

file='versions_2/parallel_all_but_5.c'
file_bin=$file.bin

gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin

for i in {1..16}; do
  echo $i
done

export OMP_NUM_THREADS=1
srun -n 1 -c 1 $file_bin -f test_files/test4 --nodelist="hydra"

export OMP_NUM_THREADS=2
srun -n 1 -c 2 $file_bin -f test_files/test4 --nodelist="hydra"

export OMP_NUM_THREADS=3
srun -n 1 -c 3 $file_bin -f test_files/test4 --nodelist="hydra"

export OMP_NUM_THREADS=4
srun -n 1 -c 4 $file_bin -f test_files/test4 --nodelist="hydra"

export OMP_NUM_THREADS=5
srun -n 1 -c 5 $file_bin -f test_files/test4 --nodelist="hydra"
# srun $file_bin -f test_files/test3


sleep 5
echo "Finished with job $SLURM_JOBID"