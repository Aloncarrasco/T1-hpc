#
# Agent-based Simulation of Fire Extinguishing
#
# Parallel computing (Degree in Computer Engineering)
# 2018/2019
#
# EduHPC 2019: Peachy assignment
#
# (c) 2019 Arturo Gonzalez-Escribano, Jorge Fernandez-Fabeiro
# Grupo Trasgo, Universidad de Valladolid (Spain)
#
# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
# https://creativecommons.org/licenses/by-sa/4.0/
#
#
# The current Parallel Computing course includes contests using:
# OpenMP, MPI, and CUDA.
#

# Compilers
CC=gcc
OMPFLAG=-fopenmp

# Flags for optimization and libs
FLAGS=-O3
LIBS=-lm

# Targets to build
OBJS=extinguishing_seq extinguishing_omp 

# Rules. By default show help
help:
	@echo
	@echo "Agent-based Simulation of Fire Extinguishing"
	@echo
	@echo "Group Trasgo, Universidad de Valladolid (Spain)"
	@echo "EduHPC 2019: Peachy assignment"
	@echo
	@echo "make extinguishing_seq	Build only the sequential version"
	@echo "make extinguishing_omp	Build only the OpenMP version"
	@echo
	@echo "make all	Build all versions (Sequential, OpenMP)"
	@echo "make debug	Build all version with demo output for small surfaces)"
	@echo "make clean	Remove targets"
	@echo

all: $(OBJS)

extinguishing_seq: extinguishing.c
	$(CC) $(DEBUG) $< $(LIBS) -o $@

extinguishing_omp: extinguishing_omp.c
	$(CC) $(DEBUG) $(OMPFLAG) $< $(LIBS) -o $@

# Remove the target files
clean:
	rm -rf $(OBJS)

# Compile in debug mode
debug:
	make DEBUG=-DDEBUG

custom:
	gcc -fopenmp -lm -O3 'versions_2/parallel_all.c' -lm -O3 -o 'parallel_all.bin'
	./parallel_all.bin -f test_files/test3