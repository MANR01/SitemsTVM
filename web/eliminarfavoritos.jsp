<%@page import="javax.crypto.ExemptionMechanismException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"  %>
<%
response.setHeader("Pragma","no-cache");
response.addHeader("Cache-control","must-revalidate");
response.addHeader("Cache-control","no-cache");
response.addHeader("Cache-control","no-store");
try{
    if(session.getAttribute("usuario")==null){
        request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
    }

}catch(Exception e){
    request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
}


%>
<!DOCTYPE html>
<html>
    
    <body>
  


        <%
                    String nombre=request.getParameter("nombre");
                    String idcliente=session.getAttribute("usuario").toString();  
                    
                    Connection conex=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    sta.executeUpdate("delete from favoritos where nombref='"+nombre+"' and idfavoritoscliente='"+idcliente+"'");
                    request.getRequestDispatcher("mostrarfavoritos.jsp").forward(request, response);
                    sta.close();
                    rs.close();
                    conex.close();
                    
                    }
                    catch(Exception e){
                      System.out.println(e);
                       }
                    
                %>
  </body>
</html>
