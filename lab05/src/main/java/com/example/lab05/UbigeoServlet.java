// Paquete en el que se encuentra la clase
package com.example.lab05;

// Importación de clases necesarias para Servlets
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Importación de clases para entrada/salida, base de datos y estructuras de datos
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Mapeo del servlet para la URL "/ubigeo"
@WebServlet("/ubigeo")
public class UbigeoServlet extends HttpServlet {

    // Método que se ejecuta al iniciar el servlet (no se usa en este caso)
    @Override
    public void init() {
        // Sin lógica adicional por ahora
    }

    // Método auxiliar para ejecutar una consulta SQL y devolver resultados
    private List<Object[]> sql(String query) {
        List<Object[]> result = new ArrayList<>();

        try {
            System.out.println("Conectando a la BD...");

            // Cargar el driver JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer conexión a la base de datos
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/202502_129V?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                    "root", "123456"
            );

            // Crear un Statement para ejecutar la consulta
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Leer los resultados
            while (rs.next()) {
                Object[] row = new Object[2];
                row[0] = rs.getString(1); // id (departamento, provincia o distrito)
                row[1] = rs.getString(2); // nombre
                result.add(row);
            }

            System.out.println("✅ Conexión y consulta exitosa");

            // Cerrar recursos
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("❌ Error al conectar o consultar la base de datos:");
            e.printStackTrace(); // Mostrar error en consola
        }

        return result;
    }

    // Método que responde a solicitudes GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Establecer tipo de contenido (HTML con codificación UTF-8)
        response.setContentType("text/html;charset=UTF-8");

        // Obtener flujo de salida para escribir la respuesta al cliente
        PrintWriter out = response.getWriter();

        // Leer el parámetro "a" que indica la acción: DEP, PRO, DIS
        String action = request.getParameter("a");

        // Variable para la consulta SQL
        String query = "";

        // Validar si se especificó la acción
        if (action == null) {
            out.println("<option value=''>Parámetro 'a' no especificado</option>");
            return;
        }

        // Definir la consulta según la acción recibida
        if (action.equalsIgnoreCase("DEP")) {
            // Obtener todos los departamentos
            query = "SELECT iddepartamento, departamento FROM departamento";

        } else if (action.equalsIgnoreCase("PRO")) {
            // Obtener provincias de un departamento específico
            String iddepartamento = request.getParameter("d");
            if (iddepartamento == null) {
                out.println("<option value=''>Falta parámetro 'd'</option>");
                return;
            }
            query = String.format(
                    "SELECT idprovincia, provincia FROM provincia WHERE iddepartamento = '%s'", iddepartamento
            );

        } else if (action.equalsIgnoreCase("DIS")) {
            // Obtener distritos de una provincia específica
            String idprovincia = request.getParameter("p");
            if (idprovincia == null) {
                out.println("<option value=''>Falta parámetro 'p'</option>");
                return;
            }
            query = String.format(
                    "SELECT iddistrito, distrito FROM distrito WHERE idprovincia = '%s'", idprovincia
            );

        } else {
            // Acción no reconocida
            out.println("<option value=''>Acción no válida: " + action + "</option>");
            return;
        }

        // Ejecutar la consulta y obtener los resultados
        List<Object[]> datos = sql(query);

        // Generar y devolver solo las <option> para insertar en un <select> ya existente
        String html = renderOptions(datos);
        out.println(html);
    }


    // Método que se ejecuta cuando se hace una solicitud HTTP POST al servlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Establecer la codificación de caracteres para recibir parámetros en UTF-8
        request.setCharacterEncoding("UTF-8");

        // Establecer el tipo de contenido que se va a devolver como respuesta (texto plano en UTF-8)
        response.setContentType("text/plain;charset=UTF-8");

        // Obtener los valores enviados desde el formulario o JavaScript (vía POST)
        String idDep = request.getParameter("iddepartamento");
        String idPro = request.getParameter("idprovincia");
        String idDis = request.getParameter("iddistrito");
        String direccion = request.getParameter("direccion");

        // Obtener el objeto para enviar respuesta al cliente
        PrintWriter out = response.getWriter();

        // Validación básica: asegurarse que ningún dato esté nulo o vacío
        if (idDep == null || idPro == null || idDis == null || direccion == null || direccion.isEmpty()) {
            out.print("❌ Datos incompletos. Inténtelo nuevamente.");
            return; // Se detiene la ejecución aquí si falta algún dato
        }

        try {
            // Cargar el driver JDBC de MySQL (permite la conexión)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión con la base de datos
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/202502_129V?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                    "root", "123456"
            );

            // Preparar la sentencia SQL con parámetros (?) para evitar inyección SQL
            String sql = "INSERT INTO registro_ubicacion (iddepartamento, idprovincia, iddistrito, direccion) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            // Asignar los valores recibidos desde el formulario a cada parámetro
            stmt.setString(1, idDep);
            stmt.setString(2, idPro);
            stmt.setString(3, idDis);
            stmt.setString(4, direccion);

            // Ejecutar la inserción en la base de datos
            int filas = stmt.executeUpdate(); // Retorna cuántas filas fueron afectadas (debería ser 1)

            // Verificar si la inserción fue exitosa
            if (filas > 0) {
                out.print("✅ Dirección registrada exitosamente.");
            } else {
                out.print("❌ No se pudo guardar la dirección.");
            }

            // Cerrar recursos para liberar memoria
            stmt.close();
            con.close();

        } catch (Exception e) {
            // En caso de error, imprimirlo en consola (para el desarrollador) y mostrar mensaje al usuario
            e.printStackTrace();
            out.print("❌ Error en el servidor al guardar la dirección.");
        }

        // Mensaje en consola para saber que se ejecutó este método
        System.out.println("🚀 Entró al método POST");
    }



    // Método para generar solo <option>...</option> para un <select>
    private String renderOptions(List<Object[]> result) {
        StringBuilder html = new StringBuilder();

        // Agregar un <option> por cada fila del resultado
        for (Object[] row : result) {
            html.append(String.format("<option value='%s'>%s</option>", row[0], row[1]));
        }

        return html.toString();
    }

    // Método opcional que se ejecuta cuando el servlet se destruye
    @Override
    public void destroy() {
        // Aquí podrías cerrar conexiones permanentes si las hubiera
    }
}
