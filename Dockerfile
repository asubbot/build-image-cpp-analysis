FROM eklementev/build-image-gcc

# ENV TZ=Europe/Moscow
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN apt-get update
# RUN apt-get install -y -q  \
#       wget git cmake gcc g++ libssl-dev libboost-all-dev qtbase5-dev qtbase5-private-dev qtdeclarative5-dev libqt5svg5-dev qttools5-dev

RUN apt-get update
RUN apt-get install -y -q  \
      wget 

RUN wget https://github.com/danmar/cppcheck/archive/2.3.tar.gz && tar -xvzf 2.3.tar.gz

RUN cd cppcheck-2.3 && mkdir build && cd build && cmake -DUSE_MATCHCOMPILER=ON .. && cmake --build . 
RUN mkdir /Cppcheck && cp /cppcheck-2.3/build/bin/cppcheck /Cppcheck/cppcheck && cp -r /cppcheck-2.3/cfg/ /Cppcheck/cfg/
