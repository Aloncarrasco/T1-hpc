
# change permisions
chmod 777 -R T1-hpc

# run slurm
sbatch slurm.sh

# compile omp extinguish
gcc  -fopenmp extinguishing_omp.c -lm -o extinguishing_omp

# compile hello (for testing)
gcc hello.c -o hello

# execute program
./extinguishing_omp -f test_files/test1

(also available test2, test3, test4)

# variant
./extinguishing_omp_1 -f test_files/test2



# Options tried
line 337:
#pragma omp parallel for private(i,j,step) reduction(max:global_residual) schedule(static)