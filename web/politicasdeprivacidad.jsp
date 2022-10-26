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
    <h1 class="bodyinformacioncorporativa">AVISO DE PRIVACIDAD</h1>
    <p class="bodyinformacioncorporativa">
        TVM(Tienda virtual de motocicletas) le informa que sus datos personales e inclusive los patrimoniales y financieros,<br>
        proporcionados por usted para utilización de nuestros servicios y compra de productos ya sea en línea, vía <br>
        telefónica y en nuestras tiendas, serán tratados para contacto, identificación, administración de sus operaciones<br>
        y de su datos personales, así como otros fines similares. Los datos personales ("Los Datos") solicitados, son<br>
        tratados por TVM(Tienda virtual de motocicletas), con la finalidad de brindarle el servicio que nos solicita,<br>
        conocer sus necesidades de productos o servicios y estar en posibilidad de ofrecerle los que más se adecuen a sus <br>
        preferencias; comunicarle promociones, atender quejas y aclaraciones, y en su caso, tratarlos para fines compatibles<br>
        con los mencionados en este Aviso de Privacidad y que se consideren análogos para efectos legales.<br>
        <br>
        En caso de formalizar con usted la aceptación de algún producto o servicio ofrecido por TVM, sus Datos serán utilizados <br>
        para el cumplimiento de las obligaciones derivadas de esa relación jurídica. Los Datos serán tratados de conformidad<br>
        con la Ley Federal de Protección de Datos Personales en Posesión de los Particulares y su Reglamento. <br>
        La confidencialidad de los Datos está garantizada y los mismos están protegidos por medidas de seguridad administrativas,<br>
        técnicas y físicas, para evitar su daño, pérdida, alteración, destrucción, uso, acceso o divulgación indebida.<br>
        Únicamente las personas autorizadas tendrán acceso a sus Datos. Podrá ejercer los derechos de acceso,<br>
        rectificación, cancelación u oposición al tratamiento de sus Datos, presentando su solicitud a través del <br>
        correo electrónico: TVM@tvm.com .<br>
        <br>TVM(Tienda virtual de motocicletas).

 
        
    
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

