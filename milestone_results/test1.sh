# Generate original .bc file
clang -Xclang -disable-O0-optnone -O0 -emit-llvm -c test1.c -o test1.bc  
# Generate .bc files
opt -enable-new-pm=0 -mem2reg test1.bc -o test1-m2r.bc  
opt -enable-new-pm=0 -load ../../unrolling/UnrollPass.so -unroll-pass -slp-unroll-count=3 test1-m2r.bc -o test1-unrolled.bc
opt -enable-new-pm=0 -simplifycfg test1-unrolled.bc -o test1-unrolled.bc # Note: This simplifycfg pass is necessary to get slp to work
opt -enable-new-pm=0 -load ../../slp_starter/SLPPass.so -slp-vectorize -slp-min-tree-size=1 -slp-threshold=-100 test1-unrolled.bc -o test1-slp.bc
# Generate .ll files
llvm-dis test1-m2r.bc
llvm-dis test1-unrolled.bc
llvm-dis test1-slp.bc
# Generate .o files
llc -filetype=obj test1-m2r.bc
llc -filetype=obj test1-unrolled.bc
llc -filetype=obj test1-slp.bc
# Generate executables
gcc -no-pie -o test1-m2r.exe test1-m2r.o
gcc -no-pie -o test1-unrolled.exe test1-unrolled.o
gcc -no-pie -o test1-slp.exe test1-slp.o
