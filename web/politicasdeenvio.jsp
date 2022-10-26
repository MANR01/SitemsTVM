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
<html lang="es">
<head>
	<link rel="shortcut icon" href="imagenes/icono.png" />
	<title>TVM</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="estilo1.css"/>
        
</head>
<body class="bodyinformacioncorporativa">
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
       <!-- <div class="contacto">
            <center>  
            <p> Contactanos </p>
            <p><img class="logos" src="fblogo.png" alt="logofb"> </p>
            <p><img class="logowhats" src="walogo.webp" alt="logowa"> </p>
            </center>
        </div>-->
        
       <a href="indexcliente.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"> </a>
<nav class="menu">
     
    <ul class="menu">
	
    <li class="menu"><a class="menu" href="indexcliente.jsp">Inicio</a></li>
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
<center>
    <h1 class="bodyinformacioncorporativa">POLÍTICAS DE ENVÍO</h1>
    <h3>COSTO DE ENVÍO</h3>
    <p class="bodyinformacioncorporativa">
        Todas nuestras unidades podrán ser entregadas sin costo alguno en cualquiera de nuestros Centros de Servicio,<br>
        contamos con más de 800 puntos en toda la República, los cuales serán los encargados de recibir, armar, activar y<br>
        entregar las unidades a cada uno de nuestros clientes.<br>
            </p>

        <h3>TIEMPO DE ENTREGA</h3>
        
        <p>
            En cuanto la compra sea realizada, deberemos esperar a la confirmación del pago recibido, una vez realizada esta<br>
            validación, recibirás la llamada por parte de tu Asesor Vento, quien iniciará el proceso de envío, de documentación <br>
            y será quien te acompañe hasta que la motocicleta se encuentre contigo.<br><br>

           El tiempo de entrega en Vento Motorcycles U.S.A varía de acuerdo a la disponibilidad del modelo adquirido.<br>
           Es sumamente importante destacar que Vento Motorcycles U.S.A se reserva el derecho de solicitar documentos <br>
           oficiales a sus clientes con la finalidad de validar la transacción generada por cualquier compra en nuestro portal.<br><br>
    
           <br>Todos los productos que se ofrecen se encuentran sujetos a disponibilidad en tienda y hasta agotar existencias.<br>
           Tiempo de entrega sujeto a disponibilidad de inventario.<br> <br>

Importante: <br>
El tiempo de entrega comienza a partir de la llamada recibida por parte de tu Asesor Vento así como de la <br>
confirmación del pago y validación de existencia del producto en el almacén (preventas), fecha que no necesariamente<br>
puede ser la del día en que generaste tu pedido,ya que la validación de pagos con tarjeta de crédito o débito puede<br>
durar hasta 48 horas hábiles.<br>
        </p>
       
    </center>
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

