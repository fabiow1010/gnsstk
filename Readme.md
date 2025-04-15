# 🛸️ GNSSTk Dev Container

Este proyecto proporciona un entorno Docker listo para usar que incluye [GNSSTk (GPS Toolkit)](https://github.com/SGL-UT/gnsstk) compilado sin bindings de Python, accesible tanto desde Jupyter Notebook como desde editores como Visual Studio Code.

---

## 🧰 Requisitos previos

Antes de empezar, asegúrate de tener instalado:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) para Windows
- [Git](https://github.com/fabiow1010/gnsstk.git) para clonar el repositorio (opcional si lo descargas como ZIP)
- (Opcional) [Visual Studio Code](https://code.visualstudio.com/) con la extensión **Dev Containers**

---

## ✨ Instrucciones de uso

### 1. Clonar el repositorio

```bash
git clone https://github.com/fabiow1010/gnsstk.git
cd tu_repositorio
```

> Reemplaza con tu nombre de usuario y repositorio reales.

---

### 2. Construir y ejecutar el contenedor

```bash
docker compose up --build
```

Esto:
- Lanza un contenedor con las librerias GnssTk y el entorno configurado
---

### 3. Usar Visual Studio Code con el contenedor

1. Abre la carpeta del proyecto en VS Code
2. Presiona `F1` → **Dev Containers: Reopen in Container**
3. Asegúrate de que las extensiones de C++ y CMake estén instaladas (ya vienen en `.devcontainer.json`)

---

## 📁 Estructura

```
📆 tu_repositorio
├── Dockerfile
├── docker-compose.yml
├── .devcontainer/
│   └── devcontainer.json
│── test_gnsstk.cpp
└── README.md
```

---

## 🧪 Probar GNSSTk ()

Puedes probar que GNSSTk está funcionando con este ejemplo básico en C++ dentro del contenedor:

```cpp
#include <gnsstk/GPSWeekSecond.hpp>
#include <iostream>

int main() {
    gnsstk::GPSWeekSecond gpsws(2245, 345600);
    std::cout << "Semana GPS: " << gpsws.week << std::endl;
    std::cout << "Segundos de la semana: " << gpsws.sow << std::endl;
    return 0;
}
```

Para compilarlo:

```bash
./test_gnsstk
```

---

## 📝 Notas

- El contenedor está configurado para conservar tus archivos (gracias al volumen `./workdir`)
- Puedes personalizar la configuración agregando más extensiones o cambiando el `Dockerfile`
- El entorno de Jupyter no tiene token para facilitar el acceso local (puedes cambiarlo en `docker-compose.yml` si lo deseas)

---

## 📌 Créditos

- [GNSSTk - GPS Toolkit](https://github.com/SGL-UT/gnsstk)
- Contenedor personalizado por [Fabian Fernandez](https://github.com/fabiow1010)

