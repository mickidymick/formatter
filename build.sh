#!/usr/bin/env bash
gcc -o formatter.so formatter.c $(yed --print-cflags) $(yed --print-ldflags)
# gcc -o formatter.so -c formatter.c $(yed --print-cflags) $(yed --print-ldflags)

# pids=()
# gcc -o formatter.o -c formatter.c $(yed --print-cflags) || exit $?
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o ASBeautifier.cpp.o -c ASBeautifier.cpp &
# pids+=($!)
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o ASEnhancer.cpp.o -c ASEnhancer.cpp &
# pids+=($!)
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o ASFormatter.cpp.o -c ASFormatter.cpp &
# pids+=($!)
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o ASLocalizer.cpp.o -c ASLocalizer.cpp &
# pids+=($!)
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o ASResource.cpp.o -c ASResource.cpp &
# pids+=($!)
# g++ -O3 -DNDEBUG   -Wall -fPIC -fno-rtti -fno-exceptions -std=c++11 -o astyle_main.cpp.o -c astyle_main.cpp &
# pids+=($!)
# for p in "${pids[@]}"; do
#     echo $p
#     wait $p || exit 1
# done
# g++ -O3 -DNDEBUG formatter.o ASBeautifier.cpp.o ASEnhancer.cpp.o ASFormatter.cpp.o ASLocalizer.cpp.o ASResource.cpp.o astyle_main.cpp.o $(yed --print-ldflags) -o formatter.so
# rm formatter.o ASBeautifier.cpp.o ASEnhancer.cpp.o ASFormatter.cpp.o ASLocalizer.cpp.o ASResource.cpp.o astyle_main.cpp.o
