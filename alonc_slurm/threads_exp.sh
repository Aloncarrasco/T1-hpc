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
#SBATCH --ntasks-per-node=16        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=1            # numero de cpus (threads) por trabajo (proceso)


function ends_with_c {
    file="$1"
    if [ "${file##*.}" = "c" ]; then
        return 0 # true
    else
        return 1 # false
    fi
}

echo 'Compiling'
gcc -fopenmp -lm -O3 '4_2_2_parallel.c' -lm -O3 -o '4_2_2_parallel.bin'

for i in {1..16}

export OMP_NUM_THREADS=1
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=2
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=3
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=4
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=5
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=6
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=7
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=8
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=9
time ./4_2_2_parallel.bin -f test_files/test4

export OMP_NUM_THREADS=10
time ./4_2_2_parallel.bin -f test_files/test4



sleep 10
echo "Finished with job $SLURM_JOBID"
