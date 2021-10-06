g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o ASBeautifier.cpp.o -c ASBeautifier.cpp
g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o ASEnhancer.cpp.o -c ASEnhancer.cpp
g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o ASFormatter.cpp.o -c ASFormatter.cpp
g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o ASLocalizer.cpp.o -c ASLocalizer.cpp
g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o ASResource.cpp.o -c ASResource.cpp
g++ -O3 -DNDEBUG   -Wall -fno-rtti -fno-exceptions -std=c++11 -o astyle_main.cpp.o -c astyle_main.cpp
g++ -O3 -DNDEBUG   -s ASBeautifier.cpp.o ASEnhancer.cpp.o ASFormatter.cpp.o ASLocalizer.cpp.o ASResource.cpp.o astyle_main.cpp.o -o astyle
rm ASBeautifier.cpp.o ASEnhancer.cpp.o ASFormatter.cpp.o ASLocalizer.cpp.o ASResource.cpp.o astyle_main.cpp.o
