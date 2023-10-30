
# change permisions
chmod 777 -R T1-hpc

# run slurm
sbatch slurm.sh

# compile omp extinguish
gcc  -fopenmp extinguishing_omp.c -lm -o extinguishing_omp

# compile hello (for testing)
gcc hello.c -o hello
