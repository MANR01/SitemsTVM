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
         <a href="index.jsp"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
         <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <li class="menu"><a class="menu" href="iniciarsesion.jsp">Iniciar sesion</a></li>
		
                <li class="menu"><a class="menu" href="registrarusuario.jsp">Registrarse</a></li>
                
                
               
               
</ul>
</nav>
</header>
<!--
<script type="text/javascript"><!--
function Abrir_ventana (pagina) {
window.alert("hla");
}
</script>
 <a href="javascript:Abrir_ventana('inventario.jsp')"><font size="1" face="Verdana">Click aquí para abrir la ventana</font></a>-->
<div class="bienvenida">
    <center><h1><i>Bienvenido</i>
         </h1> 
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
               <td> <button class="botonnuevos"><a class="botonnuevos" href="index.jsp">Yamaha YZF-R3</a></button> </td>
               <td> <button class="botonnuevos"><a class="botonnuevos" href="index.jsp">Susuki GN125</a></button> </td>
               <td> <button class="botonnuevos"><a class="botonnuevos" href="index.jsp">Honda Xr150</a></button> </td>
            
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
<!--<h3 >CONOCENOS!
<a href="https://www.facebook.com/Lettuce-Hydroponics-487273798676713/"><img src="facelogo.png"width="45" height="45" alt="facebook" /></a></h3>
-->
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
