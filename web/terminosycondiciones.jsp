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
    <table style="margin-right:50px;">
                    
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
    <h1 class="bodyinformacioncorporativa">T??RMINOS Y CONDICIONES</h1>
    <p class="bodyinformacioncorporativa">TVM mantiene este sitio para su entretenimiento, informaci??n y comunicaci??n. <br>
    Por favor si??ntase libre de explorar el Sitio. Si est?? explorando este Sitio en calidad de consumidor no comercial, podr??<br>
    bajar el material que se muestra en el Sitio solamente para su uso personal y no comercial. Si est?? explorando este Sitio<br>
    como empleado, agente o miembro de alg??n negocio u organizaci??n, podr?? bajar el material que se muestra en el Sitio solamente
    <br>para fines no comerciales dentro de su negocio u organizaci??n.</p>
    
    <p>
        Este permiso tiene espec??ficamente la condici??n que usted retenga todos los avisos sobre copyright u otro tipo de propiedad<br>
        intelectual que est??n contenidos en los materiales. Adicionalmente, no podr?? distribuir, transmitir (salvo dentro de su <br>
        negocio u organizaci??n), modificar, reutilizar, informar ni utilizar los contenidos del Sitio para fines comerciales
        o p??blicos,<br> incluidos el texto e im??genes sin autorizaci??n por escrito del ??rea de transporte.
    </p>
    <p>
        El acceso al Sitio y su uso tambi??n est??n sujetos a los siguientes ("T??rminos y Condiciones") y a toda la legislaci??n<br>
        aplicable. Determinados servicios u otras ofertas disponibles en el Sitio pueden tener t??rminos y condiciones <br>
        adicionales que deban aplicarse y pueden verse ya sea en las p??ginas que contienen dichos servicios y ofertas o a trav??s<br>
        de un v??nculo en dichas p??ginas u otros elementos que lo dirijan a los t??rminos y condiciones adicionales.<br>
        Al acceder y explorar el Sitio, usted acepta, sin limitaciones ni condiciones, los T??rminos y Condiciones que se<br>
        establecen a continuaci??n, as?? como dichos t??rminos y condiciones adicionales.     
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


