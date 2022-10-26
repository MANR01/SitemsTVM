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

<html>
    <body>


        <%
                    
                    String idcliente=session.getAttribute("usuario").toString();  
                    String idproducto=request.getParameter("id");
                    String cantidad=""+1;
                    
                    Connection conex=null;
                    Statement sta=null, sta2=null;
                    ResultSet rs=null;
                    String idp=null, nombre=null,descripcion=null,precio=null,modelo=null,categoria=null;
              
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    int i=0;
                    sta=conex.createStatement();
                    sta2=conex.createStatement();
                    rs=sta2.executeQuery("select * from producto where idProducto='"+idproducto+"'");
                    while(rs.next()){
                        idp=rs.getString(1);
                        nombre=rs.getString(2);
                        descripcion=rs.getString(3);
                        precio=rs.getString(4);
                        modelo=rs.getString(5);
                        categoria=rs.getString(6);
                       // cantidad=rs.getString(7);
                        
                    }
                    sta.executeUpdate("insert into carrito values('"+idcliente+"','"+idp+"','"+nombre+"','"+descripcion+"',"+precio+","+modelo+",'"+categoria+"','"+cantidad+"',"+i+" )");
                    
                    request.getRequestDispatcher("categorias.jsp").forward(request, response);
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
