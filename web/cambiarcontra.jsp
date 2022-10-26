<%@page import="java.text.SimpleDateFormat"%>
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
         <link rel="stylesheet" type="text/css" href="estilo3.css"/>
         <meta charset="utf-8"/>
	<title>TVM </title>
	
</head>
    <body>
  

<header> 
      
        
       <a href="indexcliente.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"> </a>
<nav class="menu">
     
    <ul class="menu">
	
    <li class="menu"><a class="menu" href="indexcliente.jsp">Inicio</a></li>
</ul>
</nav>

</header>

<div class="contenedorregistroproduct">
    <%
                String id=request.getParameter("id");
                Connection conex=null;
                Statement sta=null;
                ResultSet rs=null;
                String correo=null;
                String contra=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM cliente where idcliente='"+id+"'");
                     while(rs.next()){
                        contra=rs.getString(8);
                        correo=rs.getString(4);
                %>
                <h1>Cambiar contraseña</h1>
               <form action="" method="POST" autocomplete="off">
            <p>
               Correo:
                <input id="correo" name="correo" type="email" />
            </p>
            <p>
               Contraseña actual:
                <input id="actual" name="actual" type="password" />
            </p>
            <p>
               Nueva contraseña:
                <input id="nueva" name="nueva" type="password" />
            </p>
            <p>
               Confirmar contraseña:
                <input id="contra" name="nueva2" type="password" />
            </p>
            <button id="guardar" name="nuevacontra" type="submit" value="insertar">guardar</button>
        </form>
                <%
                   
            }//cierre while
              }//cierre try
                catch(Exception e){
                System.out.println(e);
                }
                    if(request.getParameter("nuevacontra")!=null){
                    String correo2= request.getParameter("correo");
                    String actual= request.getParameter("actual");
                    String nueva= request.getParameter("nueva");
                    String nueva2= request.getParameter("nueva2");
                        if(correo.equals(correo2)){
                            if(contra.equals(actual)){
                             if(nueva.equals(nueva2)){
                                   sta.executeUpdate("update cliente set  contraseña='"+nueva+"' where idcliente='"+id+"'");
                                   request.getRequestDispatcher("perfilusuario.jsp").forward(request, response);
                                }

                            }



                        }else{ System.out.println("datos erroneos");}
                  
                 

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
