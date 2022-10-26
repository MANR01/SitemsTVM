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
                <h1> Registrar metodo de pago</h1>
               <form action="registrartarjeta.jsp" method="POST" autocomplete="off">
            <input id="id" name="id" type="hidden"/>
            <p>
                Numero de tarjeta:
                <input id="ntarjeta" name="ntarjeta" type="number" size="16" maxlength="16" minlength="16" autocomplete="off" required/>
            </p>
            <p>
                CVC:
                <input id="cvc" name="cvc" type="number" maxlength="3" minlength="3" required/>
            </p>
            <p>
                Nombre completo<br>del titular:
                <input id="nombre" name="nombre" type="text" required/>
            </p>
            <p>
                 Fecha de vencimiento:
                 <input id="fecha" name="fecha" type="date" required/>
            </p>
            
            <button id="guardar" name="guardar2" type="submit" value="insertar">guardar</button>
        </form>
                <% 
                    String id=session.getAttribute("usuario").toString();
                     Connection conex=null;
                    Statement sta=null,sta2=null;
                    ResultSet rs=null;
                  
                    try{
                        String xd=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                     sta2=conex.createStatement();
                    rs=sta2.executeQuery("select * from metododepago where idclientemp='"+id+"' ");
                   
                   while(rs.next()){
                   xd=rs.getString(1);
                   }
                   if(xd.equals(id)){
                   System.out.println("ya tienes metodo de pago");
                    request.getRequestDispatcher("perfilusuariomensaje.jsp").forward(request, response);
                   }else if(xd!=id){
                    System.out.println("aun no tienes metodo de pago");
                   }
                   
                   }  catch(Exception e){
                     
                    
                       }
                    if(request.getParameter("guardar2")!=null){
                  
                    String ntarjeta= request.getParameter("ntarjeta");
                    String cvc= request.getParameter("cvc");
                    String nombre= request.getParameter("nombre");
                    String fecha= request.getParameter("fecha");
                  
                    
                   
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                  
                    sta2=conex.createStatement();
                    rs=sta2.executeQuery("select * from metododepago where idclientemp='"+id+"' ");
                   
                    sta=conex.createStatement();
                    sta.executeUpdate("insert into metododepago values('"+id+"','"+ntarjeta+"','"+cvc+"','"+nombre+"','"+fecha+"')");
                    request.getRequestDispatcher("indexcliente.jsp").forward(request, response);
                    
                    }
                    catch(Exception e){
                      System.out.println(e);
                      System.out.println("ya esta registrado");
                      request.getRequestDispatcher("perfilusuariomensaje.jsp").forward(request, response);
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


