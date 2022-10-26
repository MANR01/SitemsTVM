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
                Statement sta=null,sta2=null;
                ResultSet rs=null,rs2=null;
                String n=null, n2=null, terminal="",terminal2="Tarjeta con terminacion: ";
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                   
                    sta2=conex.createStatement();
                    rs2=sta2.executeQuery("SELECT numerotarjeta FROM metododepago where idclientemp='"+id+"'");
                    while(rs2.next()){
                    n2=rs2.getString(1);
                    }
                    
                       terminal = n2.substring(n2.length() - 4);
                        System.out.println(terminal);
                        
                        if(n2!=null){
                            
                            terminal2=terminal2+""+terminal;
                        }
                        
                        
                }catch(Exception e){
                terminal2="";
                }
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
                <li class="menu"><a class="menu" href="indexcliente.jsp">Inicio</a></li>
                <li><a href="mostrarfavoritos.jsp"> 
                   <button type="button" style=" background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/corazon2.png" width="50" height="50" style="margin:0;"><br>Favoritos</button></a>
                     </li>
                
                <li><a href="mostrarcarrito.jsp"> 
                   <button type="button" style="background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/carrito2.png" width="50" height="50" style="margin:0;"><br>Carrito</button></a>
                     </li>
                <table style="margin-right:50px; ">
                    
                    <tr><td><a href="perfilusuario.jsp"><img src="imagenes/usuario.png"  alt="logo" width="65px" height="60px"></a></td></tr>
                    <tr><td><a style="color: whitesmoke;
                        font-family:fantasy;
                        font-size: 14px;
                        margin: 0;
                        text-decoration:none;" href="perfilusuario.jsp"><%=n%></a></td></tr>
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
        
      
           
        <center>
            <h2>Tu perfil</h2>
            
            <div style="height:280px "> 
            <table  width="95%">
            
                <tr>
                  <th><button class="botonnuevos"><a href="Configurarcuenta.jsp?id=<%=id%>" class="botonnuevos">Modificar tus datos</a></button></th>
                  <th><button class="botonnuevos"><a href="cambiarcontra.jsp?id=<%=id%>"class="botonnuevos">Cambiar contraseña</a></button></th>
                  <th><button class="botonnuevos"><a href="registrartarjeta.jsp" class="botonnuevos">Metodo de pago</a></button></th>
                
                   
                    
                </tr>
          
          
                 <tr> 
                      <th></th>
                      <th></th>
                      <th><br><%=terminal2%></th>
                    
                       
                       
                 </tr>
             
         </table>
            
         </center> 
              </div>
    
     

    
<footer>
  <ul> 
            <li><p> CONTACTANOS</p></li>
            <li><a href="https://www.facebook.com/"><img  src="imagenes/fblogo.png" alt="logofb"> </a></li>
            <li><a href="https://web.whatsapp.com/"><img  src="imagenes/whatsapp.png" alt="logowa"> </a></li>
            <li><a href="https://www.gmail.com/"><img  src="imagenes/email.png" alt="logofb"> </a></li>
            <li><a href="https://www.twitter.com/"><img  src="imagenes/twitter.png" alt="logowa"> </a></li>
            <li><a href="https://www.instagram.com/"><img  src="imagenes/instagram.png" alt="logofb"> </a></li>
            
  </ul>
    <center>
    <a class="informacioncoorporativa" href="terminosycondiciones.html">Terminos y condiciones</a>
    <a class="informacioncoorporativa">|</a>
    <a class="informacioncoorporativa" href="politicasdeprivacidad.html">Aviso de privacidad</a>
    <a class="informacioncoorporativa">|</a>
    <a class="informacioncoorporativa" href="politicasdeenvio.html">Politicas de envio</a>
    </center>
    </footer>
</body>

</html>
