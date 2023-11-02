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
#SBATCH --ntasks-per-node=4        # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=4          # numero de cpus (threads) por trabajo (proceso)

echo 'Start'

function ends_with_c {
    file="$1"
    if [ "${file##*.}" = "c" ]; then
        return 0 # true
    else
        return 1 # false
    fi
}

for file in versions_2/*; do
  echo 'Starting with 16 cpus - no export OMP_NUM_THREADS'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin

    echo FILE: $file
    time $file_bin -f test_files/test2
  fi
done
 
for file in versions_2/*; do
  echo 'Test 2'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin
    echo FILE: $file
    time $file_bin -f test_files/test2
  fi
done

for file in versions_2/*; do
  echo 'Test 3'
  if ends_with_c $file; then
    file_bin=$file.bin
    gcc -fopenmp -lm -O3 $file -lm -O3 -o $file_bin
    echo FILE: $file
    time $file_bin -f test_files/test3
  fi
done



sleep 5
echo "Finished with job $SLURM_JOBID"