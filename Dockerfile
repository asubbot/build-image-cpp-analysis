FROM eklementev/build-image-gcc

RUN apt-get update
RUN apt-get install -y -q  \
      wget 

RUN wget https://github.com/danmar/cppcheck/archive/2.3.tar.gz && tar -xvzf 2.3.tar.gz

RUN cd cppcheck-2.3 && mkdir build && cd build && cmake -DUSE_MATCHCOMPILER=ON .. && cmake --build . 
RUN mkdir /Cppcheck && cp /cppcheck-2.3/build/bin/cppcheck /Cppcheck/cppcheck && cp -r /cppcheck-2.3/cfg/ /Cppcheck/cfg/

