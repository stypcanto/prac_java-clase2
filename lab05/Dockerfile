# Usa la imagen oficial de Tomcat 9.0 como base
FROM tomcat:9.0

# Elimina las apps por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu WAR tal cual, con nombre de contexto
COPY target/lab05.war /usr/local/tomcat/webapps/ROOT.war


# Expone el puerto 8080
EXPOSE 8080


# Para probar que funcione el ubigeo se hacer con esta ruta: http://localhost:8080/ubigeo?a=DEP