# Makefile
# GNU makefile for KKS binary phase transformation model
# Questions/comments to trevor.keller@nist.gov (Trevor Keller)

# includes
incdir = $(MMSP_PATH)/include

# compilers/flags
compiler = icc
flags = -O3 -I$(incdir)
pcompiler = mpic++
pflags = $(flags) -include mpi.h

# the program
KKS: KKS.cpp
	$(compiler) $(flags) $< -o $@ -lz -fopenmp

parallel: KKS.cpp
	$(pcompiler) $(pflags) $< -o $@ -lz

mmsp2xy: mmsp2xy.cpp
	$(compiler) $(flags) $< -o $@ -lz

clean:
	rm -f KKS parallel
