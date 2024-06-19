# Makefile

# Compiler and compiler flags
NVCC = nvcc
QDLDL-FLAGS = --compiler-options -Wall  -O2 -Iinclude -Iinclude/common -IGBD-PCG/GLASS -IGBD-PCG/include  -lqdldl  -Iqdldl/include -Lqdldl/build/out -lcublas
PCG-FLAGS = --compiler-options -Wall -O2 -Iinclude -Iinclude/common -IGBD-PCG/GLASS -IGBD-PCG/include -lcublas

examples: pcg qdldl


create_dir:
	mkdir -p tmp/results

pcg: create_dir
	$(NVCC) $(PCG-FLAGS) examples/track_iiwa_pcg.cu -o examples/pcg.exe


build_qdldl:
	cd qdldl && mkdir -p build && cd build && cmake -DQDLDL_FLOAT=true -DQDLDL_LONG=false .. && cmake --build .
	
install_qdldl: build_qdldl
	cd qdldl/build && sudo make install

qdldl: create_dir install_qdldl
	 $(NVCC) $(QDLDL-FLAGS) -DLINSYS_SOLVE=0 examples/track_iiwa_qdldl.cu -o examples/qdldl.exe


clean:
	rm -f examples/*.exe && rm -f tmp/results/*
