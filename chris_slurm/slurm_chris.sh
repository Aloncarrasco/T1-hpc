#!/bin/bash
#SBATCH --job-name=hpc_t1_klempau       # nombre del trabajo
#SBATCH -p ialab-high
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o c_job.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o fa$
#SBATCH --mail-user=christian.klempau@uc.cl       # mail donde mandar las notifica$
#SBATCH --workdir=/home/christian.klempau/T1-hpc         # direccion del d$
#

function ends_with_c {
    file="$1"
    if [ "${file##*.}" = "c" ]; then
        return 0 # true
    else
        return 1 # false
    fi
}

for file in versions/*; do
  echo 'Starting with 16 cpus - no export OMP_NUM_THREADS'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin

    #SBATCH --nodes 1                    # numero de nodos a usar
    #SBATCH --cpus-per-task=16           # numero de cpus (threads) por trabajo (proceso)
    echo FILE: $file
    time $file_bin -f test_files/test2
  fi
done

for file in versions/*; do
  echo 'Starting with 16 cpus - export OMP_NUM_THREADS=16'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin
    #SBATCH --nodes 1                    # numero de nodos a usar
    #SBATCH --cpus-per-task=16           # numero de cpus (threads) por trabajo (proceso)
    export OMP_NUM_THREADS=16
    echo FILE: $file
    time $file_bin -f test_files/test2
  fi
done

for file in versions/*; do
  echo 'Starting with 32 cpus - export OMP_NUM_THREADS=32'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin
    #SBATCH --nodes 1                    # numero de nodos a usar
    #SBATCH --cpus-per-task=32           # numero de cpus (threads) por trabajo (proceso)
    export OMP_NUM_THREADS=32
    echo FILE: $file
    time $file_bin -f test_files/test2
  fi
done



sleep 10
echo "Finished with job $SLURM_JOBID"
