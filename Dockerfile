FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependencias básicas
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    vim \
    curl \
    g++ \
    libboost-all-dev \
    libgsl-dev \
    swig \
    python3 \
    python3-pip \
    python3-dev \
    jupyter \
    && apt-get clean

# Clonar el repositorio GNSSTk
WORKDIR /opt
RUN git clone https://github.com/SGL-UT/gnsstk.git 

# Compilar SIN bindings de Python
WORKDIR /opt/gnsstk/build
RUN cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gnsstk \
    -DBUILD_PYTHON=OFF \
    -DBUILD_EXT=OFF \
    -DCMAKE_CXX_STANDARD=14 && \
    make -j$(nproc) && \
    make install

# Añadir binarios al PATH
ENV PATH="/usr/local/gnsstk/bin:$PATH"

# Añadir librerías compartidas al LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH="/usr/local/gnsstk/lib:$LD_LIBRARY_PATH"

# Crear carpeta de trabajo
WORKDIR /workspace
VOLUME /workspace

# Lanzar Jupyter con terminal (útil si quieres probar comandos de gnsstk como CLI)
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
