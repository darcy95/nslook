FROM perl:5-slim
WORKDIR /usr/src/nslook/
COPY M_Ansi.pm /usr/src/nslook/
COPY M_Bin.pm /usr/src/nslook/
COPY nslook /usr/src/nslook/
