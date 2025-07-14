# 🌍 Registro de Ubicación - Java Servlet + MySQL

Aplicación web para selección jerárquica de ubicación geográfica (Departamento/Provincia/Distrito) con registro en base de datos MySQL.

![Badge](https://img.shields.io/badge/Java-17%2B-orange)
![Badge](https://img.shields.io/badge/Servlet-Jakarta%20EE-blue)
![Badge](https://img.shields.io/badge/MySQL-8.x-lightblue)

## 🚀 Características principales

✅ Carga dinámica de ubicaciones (cascada Departamentos → Provincias → Distritos)  
✅ Formulario de dirección con validación básica  
✅ Persistencia en base de datos MySQL  
✅ Interfaz responsive con JavaScript vanilla  
✅ Arquitectura MVC básica  

## 🛠️ Stack Tecnológico

| Categoría       | Tecnologías                     |
|-----------------|---------------------------------|
| Backend         | Java 17+, Jakarta EE Servlets   |
| Frontend        | HTML5, CSS3, JavaScript vanilla |
| Servidor        | Apache Tomcat 10.1              |
| Base de datos   | MySQL 8.x                       |
| Conexión BD     | JDBC Driver (`mysql-connector-j`)|
| IDE             | IntelliJ IDEA                   |

## 📂 Estructura del Proyecto

```plaintext
Cibertec_ejercicios/
│
├── Ejercicio1/
│   ├── src/
│   │   └── com/example/lab05/
│   │       ├── UbigeoServlet.java    # Controlador principal
│   │       └── DatabaseUtil.java     # Utilidades de conexión a BD (opcional)
│   ├── web/
│   │   ├── index.html                # Vista principal
│   │   ├── script.js                 # Lógica frontend
│   │   └── style.css                 # Estilos
│   └── WEB-INF/
│       ├── web.xml                   # Configuración Servlet
│       └── lib/                      # Dependencias (JDBC driver)

## 🗃️ Esquema de Base de Datos

-- Tabla de Departamentos
CREATE TABLE departamento (
  iddepartamento INT PRIMARY KEY AUTO_INCREMENT,
  departamento VARCHAR(100) NOT NULL
);

-- Tabla de Provincias (relacionada con Departamentos)
CREATE TABLE provincia (
  idprovincia INT PRIMARY KEY,
  iddepartamento INT NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento)
);

-- Tabla de Distritos (relacionada con Provincias)
CREATE TABLE distrito (
  iddistrito INT PRIMARY KEY,
  idprovincia INT NOT NULL,
  distrito VARCHAR(100) NOT NULL,
  FOREIGN KEY (idprovincia) REFERENCES provincia(idprovincia)
);

-- Tabla para registrar direcciones
CREATE TABLE registro_ubicacion (
  id INT PRIMARY KEY AUTO_INCREMENT,
  iddepartamento INT,
  idprovincia INT,
  iddistrito INT,
  direccion VARCHAR(255) NOT NULL,
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento),
  FOREIGN KEY (idprovincia) REFERENCES provincia(idprovincia),
  FOREIGN KEY (iddistrito) REFERENCES distrito(iddistrito)
);

