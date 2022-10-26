<%@page import="javax.crypto.ExemptionMechanismException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagenes/icono.png" />
	<title>TVM</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="estilo1.css"/>
       </head> 
    <body>
	<header> 
         <a href="index.html"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
         <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <li class="menu"><a class="menu" href="index.jsp">Inicio</a></li>
		<li class="menu" ><a class="menu" href="registrarusuario.jsp">Registrarte</a></li>
		<li class="menu"><a class="menu" href="registrarproducto.jsp">Registrar producto</a></li>
                <li class="menu"><a class="menu" href="iniciarsesion.html">Iniciar sesion</a></li>
               <!-- <li class="menu"><a class="menu" href="agregarmetodopago.html">Registrar metodo de pago</a></li>-->
                <li class="menu"><a class="menu" href="configurarcuenta.html">Catalogo <br>de productos</a></li>
                
               
               
</ul>
</nav>
</header>
 
    <section >
        <center>
        
            <h1>ELIMINAR PRODUCTOS</h1>
         <table border="1" width="80%">
            
                <tr bgcolor="lightblue">
                    <th>id</th>
                    <th>nombre</th>
                    <th>descripcion</th>
                    <th>precio</th>
                    <th>modelo</th>
                    <th>categoria</th>
                    <th>Actualizar</th>
                    <th>Eliminar</th>
                </tr>
          
            <% 
                Connection conex=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM producto");
                     while(rs.next()){
                 %>
                 <tr> 
                      <th><%=rs.getString(1) %></th>
                      <th><%=rs.getString(2) %></th>
                      <th><%=rs.getString(3) %></th>
                      <th><%=rs.getString(4) %></th>
                      <th><%=rs.getString(5) %></th>
                      <th><%=rs.getString(6) %></th>
                      <th><a href="actualizarproducto.jsp?id=<%=rs.getString(1)%>"> 
                      <img src="imagenes/actualizar.png" width="40" height="35"></a></th>
                      <th><a href="eliminarproducto2.jsp?id=<%=rs.getString(1)%>"> 
                      <img src="imagenes/eliminar.png" width="42" height="37"></a></th>
                       
                       
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
    </section>  

    

</body>

</html>