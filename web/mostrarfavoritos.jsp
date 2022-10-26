<%@page import="javax.crypto.ExemptionMechanismException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <head>
        <link rel="shortcut icon" href="imagenes/icono.png" />
	<title>TVM</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="estilo1.css"/>
       </head> 
    <body>
        <%  String id=session.getAttribute("usuario").toString();

                Connection conex=null;
                Statement sta=null;
                ResultSet rs=null;
                Statement sta2=null;
                ResultSet rs2=null;
                String n=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT Nombre FROM cliente where idcliente='"+id+"'");
                    while(rs.next()){
                    n=rs.getString(1);
                    }
                
                }catch(Exception e){
                System.out.println(e);
                }
                %>
	<header> 
         <a href="indexcliente.jsp"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
          <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <!-- <li class="menu"><a class="menu" href="agregarmetodopago.html">Registrar metodo de pago</a></li>
                <li class="menu"><a class="menu" href="configurarcuenta.html">Catalogo <br>de productos</a></li>
                <li class="menu"><a class="menu" href="cerrarsesion.jsp">Cerrar sesion</a></li>-->
                <li class="menu"><a class="menu" href="indexcliente.jsp">Volver</a></li>
                <table style="margin-right:50px; ">
                    
                    <tr><td><a href="Configurarcuenta.jsp?id=<%=id%>"><img src="imagenes/usuario.png"  alt="logo" width="65px" height="60px"></a></td></tr>
                    <tr><td><a style="color: whitesmoke;
                        font-family:fantasy;
                        font-size: 14px;
                        margin: 0;
                        text-decoration:none;" href="Configurarcuenta.jsp?id=<%=id%>"><%=n%></a></td></tr>
                    <tr><td><a style="color: red;
                        font-family:fantasy;
                        font-size: 10px;
                        margin: 0;
                        text-align: center;
                        text-decoration:none;" href="cerrarsesion.jsp">Cerrar sesion</a></td></tr>
                   
                    
                
                </table>
                
               
               
</ul>
</nav>
</header>
        
        <div class="cabezerainventario" >
     
            <h1 style="padding-left: 43%;">Lista de deseos</h1>
         </div>
           
        <center>
        
           
         
          
            <% 
             
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    sta2=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM favoritos where idfavoritoscliente='"+id+"' group by nombref");
                    
                    
                   
                  %>
                  <table  width="70%">
            
                <tr >
                     <th></th>
                    <th ></th>
                    
                    
                    
                </tr>
            
            
            <%     
                     while(rs.next()){
               
              
                 %>
                 <tr> 
                     <th><img src="imagenes/<%=rs.getString(3)%>.jpg" width="210px" height="180px"><br><%=rs.getString(3)%></th>
                     <th><h3>$: <%=rs.getString(5)%> mxn </h3>
                         Tipo: <%=rs.getString(7) %><br>
                         
                        
                         
                         <a  href="eliminarfavoritos.jsp?nombre=<%=rs.getString(3)%>"> 
                             <button type="button" style="font-family:fantasy; font-size: 15px; color:red; text-decoration: none; margin:0;"> <img src="imagenes/quitarfavorito.png" width="30" height="30" style="margin:0;"><br>Eliminar<br>de favoritos</button></a>
                          <a href="carrito.jsp?id=<%=rs.getString(1)%>"> 
                   <button type="button" style="font-family:fantasy; font-size: 15px; color:black; text-decoration: none; margin:0;"> <img src="imagenes/carrito.png" width="30" height="30" style="margin:0;"><br>Agregar al<br>carrito</button></a>
                    
                     </th>
                   
                     
                    
                     
                       
                       
                 </tr>
               
            <%
            } 
                sta.close();
                rs.close();
                conex.close();
         
                }
                catch(Exception e){
                System.out.println(e);
                }
            
            %>
             
         </table>
        
        </center> 
     </body>
</html>

