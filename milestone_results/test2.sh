# Generate original .bc file
clang -Xclang -disable-O0-optnone -O0 -emit-llvm -c test2.c -o test2.bc  
# Generate .bc files
opt -enable-new-pm=0 -mem2reg test2.bc -o test2-m2r.bc  
opt -enable-new-pm=0 -load ../../unrolling/UnrollPass.so -unroll-pass -slp-unroll-count=4 test2-m2r.bc -o test2-unrolled.bc
opt -enable-new-pm=0 -simplifycfg test2-unrolled.bc -o test2-unrolled.bc # Note: This simplifycfg pass is necessary to get slp to work
opt -enable-new-pm=0 -load ../../slp_starter/SLPPass.so -slp-vectorize -slp-min-tree-size=1 -slp-threshold=-100 test2-unrolled.bc -o test2-slp.bc
# Generate .ll files
llvm-dis test2-m2r.bc
llvm-dis test2-unrolled.bc
llvm-dis test2-slp.bc
# Generate .o files
llc -filetype=obj test2-m2r.bc
llc -filetype=obj test2-unrolled.bc
llc -filetype=obj test2-slp.bc
# Generate executables
gcc -no-pie -o test2-m2r.exe test2-m2r.o
gcc -no-pie -o test2-unrolled.exe test2-unrolled.o
gcc -no-pie -o test2-slp.exe test2-slp.o
