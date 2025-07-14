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

| Categoría       | Tecnologías                            |
|-----------------|----------------------------------------|
| Backend         | Java 17+, Jakarta EE (`javax.servlet`) |
| Frontend        | HTML5, CSS3, JavaScript vanilla        |
| Servidor        | Apache Tomcat 9.x                      |
| Base de datos   | MySQL 8.x                              |
| Conexión BD     | JDBC Driver (`mysql-connector-j`)      |
| IDE             | IntelliJ IDEA                          |
| Contenedores    | Docker, Docker Compose                 |

---

## 📂 Estructura del Proyecto Ubigeo

```plaintext
Cibertec_ejercicios/
└── Ejercicio2/
    ├── docker-compose.yml              # Orquestación de servicios (Tomcat + MySQL)
    ├── Dockerfile                      # Imagen personalizada de Tomcat con WAR desplegado
    ├── pom.xml                         # Configuración de dependencias y build (Maven)
    ├── target/
    │   └── lab05.war                   # Archivo WAR generado para despliegue
    └── src/
        ├── main/
        │   ├── java/
        │   │   └── com/example/lab05/
        │   │       ├── UbigeoServlet.java    # Servlet principal
        │   │       └── HelloServlet.java     # Servlet de prueba
        │   ├── resources/                    # (Vacío o config adicionales)
        │   └── webapp/
        │       ├── index.html                # Página de inicio
        │       ├── css/
        │       │   └── estilos.css           # Estilos frontend
        │       ├── js/
        │       │   └── ubigeo.js             # JS frontend
        │       └── WEB-INF/
        │           └── web.xml               # Configuración de servlets
        └── test/
            ├── java/                         # (Opcional para tests)
            └── resources/


## 🗃️ Base de datos
```sql
CREATE TABLE departamento (
  iddepartamento INT PRIMARY KEY AUTO_INCREMENT,
  departamento VARCHAR(100) NOT NULL
);

CREATE TABLE provincia (
  idprovincia INT PRIMARY KEY,
  iddepartamento INT NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento)
);

CREATE TABLE distrito (
  iddistrito INT PRIMARY KEY,
  idprovincia INT NOT NULL,
  distrito VARCHAR(100) NOT NULL,
  FOREIGN KEY (idprovincia) REFERENCES provincia(idprovincia)
);

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
```

## ⚙️ 1. Configuración

### ⚙️ Configuración de la Base de Datos (en `DatabaseUtil.java`)

Cuando el proyecto se ejecuta dentro de Docker (con `docker-compose`), **el hostname no debe ser `localhost`**, sino el **nombre del servicio** definido en `docker-compose.yml`, que normalmente es `mysql`:

```java
String url = "jdbc:mysql://mysql:3306/ubigeo_db?useSSL=false&allowPublicKeyRetrieval=true";
String username = "root";
String password = "123456";
```

## ⚙️ 2. Configuración de Tomcat (usando Docker)

El proyecto se empaqueta como un archivo `.war` usando Maven, y se despliega automáticamente en un contenedor de Tomcat mediante Docker.

### ✅ JDBC Driver

No es necesario colocar manualmente el `mysql-connector-j` en `WEB-INF/lib/`.  
Maven se encarga de descargar la dependencia automáticamente y la incluye en el `.war` generado durante el build (`mvn clean package`).

Asegúrate de que en tu `pom.xml` esté incluida esta dependencia:

```xml
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.0.33</version>
</dependency>
```


## ⚙️ 3. Configuración web.xml
```xml
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
         version="6.0">
    <!-- No se definen servlets aquí ya que se usan anotaciones (@WebServlet) -->
<!-- 
📄 El archivo web.xml ubicado en src/main/webapp/WEB-INF/ tiene una configuración mínima, 
ya que el proyecto utiliza anotaciones de Jakarta EE (@WebServlet) para registrar los servlets automáticamente.

✅ Esto permite mantener el archivo limpio y aprovechar las capacidades modernas del estándar Jakarta EE 10 
(compatible con Tomcat 10.1).

Si en el futuro se requiere una configuración explícita, se pueden añadir manualmente etiquetas 
<servlet> y <servlet-mapping>.
-->


</web-app>

```


## 🚀 Mejoras Avanzadas Pendientes

### 🔧 Arquitectura y Frameworks
| Mejora | Tecnología Recomendada | Beneficio |
|--------|------------------------|-----------|
| Implementar Spring Boot | Spring Boot 3.x | Inyección de dependencias, auto-configuración |
| Migrar a JPA/Hibernate | Spring Data JPA | ORM, repositorios automáticos |
| API RESTful | Spring MVC/Jakarta REST | Endpoints modernos |
| Seguridad | Spring Security | Auth JWT, OAuth2, CSRF |
| Frontend moderno | Thymeleaf/JSF/React | SPA/PWA |

### 🧪 Testing Profesional
```java
// Ejemplo test con JUnit 5 + Mockito
@ExtendWith(MockitoExtension.class)
class UbigeoServiceTest {
    
    @Mock
    private UbigeoRepository repository;
    
    @InjectMocks
    private UbigeoServiceImpl service;
    
    @Test
    void whenValidUbigeo_thenShouldSave() {
        UbigeoDto dto = new UbigeoDto(...);
        when(repository.save(any())).thenReturn(mockUbigeo);
        
        UbigeoDto result = service.registerUbigeo(dto);
        
        assertNotNull(result);
        verify(repository).save(any());
    }
}
```
---

# 🐳 Configuración Docker Compose para Entorno de Desarrollo

## 📁 docker-compose.yml
```yaml


# Versión de la sintaxis de Docker Compose
# Desde Compose v3.9 ya no es necesaria, por eso da una advertencia
version: '3.8'

services:
  # Servicio 1: Base de datos MySQL
  mysql:
    image: mysql:latest                       # Usa la última imagen oficial de MySQL desde Docker Hub
    container_name: mysql-container           # Nombre fijo para el contenedor, útil para identificarlo
    environment:                              # Variables de entorno para configurar MySQL
      MYSQL_ROOT_PASSWORD: 123456             # Contraseña del usuario root (¡nunca uses esta en producción!)
      MYSQL_DATABASE: 202502_129V             # Nombre de la base de datos que se crea al iniciar
    ports:
      - "3306:3306"                           # Expone el puerto 3306 al host, para poder conectarte desde tu PC
    volumes:
      - mysql-data:/var/lib/mysql             # Monta un volumen para guardar los datos de forma persistente
    networks:
      - red-interna                           # Conecta este contenedor a una red interna compartida

  # Servicio 2: Aplicación Java en Tomcat
  tomcat:
    build: .                                  # Construye la imagen usando el Dockerfile del directorio actual (./)
    container_name: tomcat-app                # Nombre del contenedor de la aplicación web
    ports:
      - "8080:8080"                           # Expone el puerto 8080 para acceder desde el navegador (http://localhost:8080)
    depends_on:
      - mysql                                 # Asegura que el contenedor de MySQL se inicie antes que Tomcat
    networks:
      - red-interna                           # También se conecta a la red interna para comunicarse con MySQL

# Definición de volúmenes (almacenamiento persistente)
volumes:
  mysql-data:
    external: true                            # Usa un volumen ya existente (NO lo crea automáticamente)
    name: 8d146fb5ac3c7020708772f535f7e64bd97101f32b9ae3e14aae7fb306311ffe
    # Nombre real del volumen que contiene tus datos previos de MySQL

# Definición de redes internas entre los contenedores
networks:
  red-interna:
    driver: bridge                            # Tipo de red por defecto: permite comunicación interna segura entre contenedores



```


## 🛠️ Evolución Tecnológica Recomendada

### 🔍 Análisis Comparativo de Stacks
| Capa               | Tecnología Actual | Recomendación Profesional | Beneficios                           |
|--------------------|-------------------|---------------------------|--------------------------------------|
| **Frontend**       | Vanilla JS        | React/Vue.js              | Componentes reusables, Estado centralizado |
| **Backend**        | Servlets puros    | Spring Boot               | Auto-configuración, Starter packs    |
| **Persistencia**   | JDBC directo      | JPA/Hibernate             | ORM, Cache, JPQL                     |
| **Testing**        | Manual            | JUnit 5 + Mockito         | Automatización, Coverage reports     |
| **Deployment**     | Manual            | Docker + Kubernetes       | Escalabilidad, CI/CD integration     |

### 📚 Frameworks Recomendados
#### Backend
- **Spring Boot** - Ecosistema completo (MVC, Security, Data)
- **Micronaut** - Alternativa liviana para microservicios

#### Persistencia
- **Hibernate** - ORM con soporte para múltiples dialectos SQL
- **Spring Data JPA** - Repositorios automáticos + Query Methods

#### Utilidades
```java
// Ejemplo con Lombok y MapStruct
@Data @Builder // Lombok
@Entity
public class Ubigeo {
    private Long id;
    private String departamento;
}

@Mapper(componentModel = "spring") // MapStruct
public interface UbigeoMapper {
    UbigeoDto toDto(Ubigeo entity);
}
```

## 🤔 ¿Necesitas Incorporar Frameworks?

### ✅ **Casos donde se recomienda usar Frameworks**
| Escenario | Beneficio | Framework Ejemplo |
|-----------|-----------|-------------------|
| Proyectos con vida útil > 6 meses | Mantenibilidad a largo plazo | Spring Boot |
| Equipos de > 2 desarrolladores | Estandarización del código | Angular/React |
| Requerimientos de seguridad complejos | Autenticación/OAuth2 integrado | Spring Security |
| Integración con otros sistemas | Conexión simplificada a APIs | Apache Camel |

### ❌ **Casos donde puedes evitarlos**
```diff
- Ejercicios de aprendizaje básico (mejor entender fundamentos)
- Prototipos temporales (time-to-market rápido)
- Entornos con restricciones de tamaño (IoT/Embedded)
- Cuando el overhead > beneficios (microservicios muy pequeños)
```
## 📊 Benchmark Comparativo: Servlets vs Spring Boot

| Métrica               | Servlets        | Spring Boot     | Diferencia Visual |
|-----------------------|-----------------|-----------------|-------------------|
| **Tiempo Desarrollo** | 100% (Base)     | 40%             | ⏳ 60% más rápido  |
| **Performance**       | 100% (Base)     | 85%             | ⚡ 15% más lento   |
| **Seguridad**         | 🔓 Nivel Básico | 🔐 Enterprise   | 🛡️ +300% features |
| **Mantenibilidad**    | 🛠️ Difícil      | ✨ Fácil        | 🧰 70% mejora     |
| **Escalabilidad**     | ⚖️ Limitada     | 🚀 Alta         | 📈 Crecimiento horizontal |

### 🔍 Explicación Técnica
1. **Tiempo Desarrollo**:
   ```diff
   + Spring Boot reduce código boilerplate con:
   - Auto-configuración
   - Starter dependencies
   - Anotaciones simplificadas




## 👨‍💻 Autor

**Styp Canto**  
*Desarrollador Java Full Stack*

[![GitHub](https://img.shields.io/badge/GitHub-@stypcanto-181717?style=for-the-badge&logo=github)](https://github.com/stypcanto)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Perfil-blue?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/tu-perfil)  
[![Email](https://img.shields.io/badge/Email-Contactar-red?style=for-the-badge&logo=gmail)](mailto:tu@email.com)





  
  ```java
  public class SobreMi {
    public static void main(String[] args) {
      System.out.println("Apasionado por el desarrollo backend");
      System.out.println("Especializado en Java EE y Spring Boot");
      System.out.println("Construyendo soluciones escalables");
    }
  }

  ```

### 📚 Sobre Mí
- 🔭 Actualmente trabajando en mejorar mis habilidades Java EE
- 🌱 Aprendiendo Spring Boot y arquitecturas limpias
- 💬 Pregúntame sobre Servlets y JDBC
- 📫 Cómo contactarme: [Twitter @tuusuario](https://twitter.com/tuusuario)
- ⚡ Dato curioso: Amante del café ☕ y la programación funcional

### 🏆 Logros
[![GitHub Streak](https://streak-stats.demolab.com?user=stypcanto&theme=dark)](https://git.io/streak-stats)
