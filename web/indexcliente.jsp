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
                <li class="menu"><a class="menu" href="categorias.jsp">Catalogo</a></li>
                
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


<div class="bienvenida">
<center><h1>
        <i>BIENVENIDO </i></h1> 
    <!--<br><h3 style="color:black;text-shadow: grey 0.2em 0.2em 0.3em"><i></i></h3>-->
	</center>
</div>




    <div class="slider">
         <center><h2 class="masvendidos"> Conoce nuestros modelos mas vendidos</h2> </center>
        <ul class="slider">
           
            <marquee>
                <li class="slider"><img class="slider" src="imagenes/vento1.png" alt="logofb"></li>
		<li class="slider"><img class="slider" src="imagenes/vento2.png" alt="logofb"></li>
                <li class="slider"><img class="slider" src="imagenes/vento3.png" alt="logofb"></li>
                <li class="slider"><img class="slider" src="imagenes/vento4.png" alt="logofb"></li>
                <li class="slider"><img class="slider" src="imagenes/vento5.png" alt="logofb"></li>
                <li class="slider"><img class="slider" src="imagenes/vento6.png" alt="logofb"></li>
             
            </marquee>
             
               
		
	
</ul>
</div>
    
   <section >
        <center><h2> MODELOS NUEVOS</h2>
        
            <button type="image"> <img class="caja" src="imagenes/moto2.png" alt="logofb"></button>
            <button type="image"> <img class="caja" src="imagenes/moto1.png" alt="logofb"></button>
            <button type="image"> <img class="caja" src="imagenes/moto3.png" alt="logofb"></button>
            
            
	
        <table>
            <tr>
               <td> <button class="botonnuevos"><a class="botonnuevos" href="categorias.jsp">Yamaha YZF-R3</a></button> </td>
               <td> <button class="botonnuevos"><a class="botonnuevos" href="categorias.jsp">Susuki GN125</a></button> </td>
               <td> <button class="botonnuevos"><a class="botonnuevos" href="categorias.jsp">Honda Xr150</a></button> </td>
            
            </tr>
               
               
	</table>
        
        </center> 
    </section> 

    <aside class="lateral">
         <button class="lateralbutton" > <img class="lateralimg" src="imagenes/descuento1.jpeg" alt="logofb"></button>
          <button class="lateralbutton" > <img class="lateralimg" src="imagenes/aceite1.jpeg" alt="logofb"></button>
    </aside>
    
    <div class="divrefacciones">
         <img src="imagenes/refacciones1.png" alt="logofb" >
        
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
    <a class="informacioncoorporativa" href="terminosycondiciones.jsp">Terminos y condiciones</a>
    <a class="informacioncoorporativa">|</a>
    <a class="informacioncoorporativa" href="politicasdeprivacidad.jsp">Aviso de privacidad</a>
    <a class="informacioncoorporativa">|</a>
    <a class="informacioncoorporativa" href="politicasdeenvio.jsp">Politicas de envio</a>
    </center>
    </footer>
</body>

</html>
