<%@page import="javax.crypto.ExemptionMechanismException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<link rel="shortcut icon" href="imagenes/icono.png" />
         <link rel="stylesheet" type="text/css" href="estilo3.css"/>
         <meta charset="utf-8"/>
	<title>TVM </title>
	
</head>
    <body>
  

<header> 
      
        
       <a href="index.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"> </a>
<nav class="menu">
     
    <ul class="menu">
	
    <li class="menu"><a class="menu" href="index.jsp">Inicio</a></li>
</ul>
</nav>

</header>

<div class="contenedorregistroproduct">
                <h1> Registro de usuario</h1>
               <form action="registrarusuario.jsp" method="POST" autocomplete="off">
            <input id="id" name="id" type="hidden"/>
            <p>
                Nombre completo:
                <input id="nombre" name="nombre" type="text" autocomplete="off" required/>
            </p>
            <p>
                Fecha de nacimiento:
                <input id="fecha" name="fecha" type="date" required/>
            </p>
            <p>
                Correo electronico:
                <input id="correo" name="correo" type="email" required/>
            </p>
            <p>
                 Telefono:
                 <input id="telefono" name="telefono" type="tel" size="10" maxlength="10" required/>
            </p>
             <p>
                 Dirección:
                <input id="direccion" name="direccion" type="text" required/>
            </p>
            <p>
                 Codigo postal:
                 <input id="cp" name="cp" type="number" size="5" maxlength="5" required />
            </p>
            <p>
                 Contraseña:
                <input id="contra" name="contra" type="password" required/>
            </p>
            <button id="guardar" name="guardar2" type="submit" value="insertar">guardar</button>
        </form>
                <%
                    if(request.getParameter("guardar2")!=null){
                    int id=0;
                    String nombre= request.getParameter("nombre");
                    String fecha= request.getParameter("fecha");
                    String correo= request.getParameter("correo");
                    double telefono= Double.parseDouble(request.getParameter("telefono"));
                    String direccion= request.getParameter("direccion");
                    int cp= Integer.parseInt(request.getParameter("cp"));
                    String contra= request.getParameter("contra");
                 
                    Connection conex=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    try{
                  
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    sta.executeUpdate("insert into cliente values("+id+",'"+nombre+"','"+fecha+"','"+correo+"',"+telefono+",'"+direccion+"',"+cp+",'"+contra+"')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                    }
                    catch(Exception e){
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                      System.out.println(e);
                      %>
                       
                
                <%
                       }
                    }
                %>
</div>

                        
          
		

 <aside class="asidelogo">
       <img class="logo" src="imagenes/registrarusuario1.png" alt="logo"> 
   </aside>     

                 
<footer>
  <ul> 
            <li><p> CONTACTANOS</p></li>
            <li><a href="https://www.facebook.com/"><img  src="imagenes/fblogo.png" alt="logofb"> </a></li>
            <li><a href="https://web.whatsapp.com/"><img  src="imagenes/whatsapp.png" alt="logowa"> </a></li>
            <li><a href="https://www.gmail.com/"><img  src="imagenes/email.png" alt="logofb"> </a></li>
            <li><a href="https://www.twitter.com/"><img  src="imagenes/twitter.png" alt="logowa"> </a></li>
            <li><a href="https://www.instagram.com/"><img  src="imagenes/instagram.png" alt="logofb"> </a></li>
            
  </ul>
    </footer>
	


</body>
</html>

