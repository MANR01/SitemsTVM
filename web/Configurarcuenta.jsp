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
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM cliente where idcliente='"+id+"'");
                     while(rs.next()){
                %>
                <h1> Actualiza tu informacion</h1>
               <form action="" method="POST" autocomplete="off">
            <input id="id" name="id" type="hidden"/>
            <p>
                Nombre completo:
                <input id="nombre" name="nombre" type="text" autocomplete="off" value="<%=rs.getString(2)%>" required/>
            </p>
            <p>
                Fecha de nacimiento:
                <%System.out.println(rs.getString(3));
                String f= rs.getString(3)+"";
                %>
                    
               
                <input id="fecha" name="fecha" type="date" value="<%=f%>" required/>
            </p>
            <p>
                Correo electronico:
                <input id="correo" name="correo" type="email" value="<%=rs.getString(4)%>" required/>
            </p>
            <p>
                 Telefono:
                 <input id="telefono" name="telefono" type="number" size="10" value="<%=rs.getString(5)%>" maxlength="10" minlength="10" required/>
            </p>
             <p>
                 Dirección:
                <input id="direccion" name="direccion" type="text" value="<%=rs.getString(6)%>" required/>
            </p>
            <p>
                 Codigo postal:
                 <input id="cp" name="cp" type="number" size="5" value="<%=rs.getString(7)%>" maxlength="5" minlength="5" required/>
            </p>
            <p>
                <!-- Contraseña:-->
                <input id="contra" name="contra" type="hidden" value="<%=rs.getString(8)%>"/>
            </p>
            <button id="guardar" name="actualizar1" type="submit" value="insertar">guardar</button>
        </form>
                <%
                   
            }//cierre while
              }//cierre try
                catch(Exception e){
                System.out.println(e);
                }
                    if(request.getParameter("actualizar1")!=null){
                    
                    String nombre= request.getParameter("nombre");
                    String fecha= request.getParameter("fecha");
                    String correo= request.getParameter("correo");
                    double telefono= Double.parseDouble(request.getParameter("telefono"));
                    String direccion= request.getParameter("direccion");
                    int cp= Integer.parseInt(request.getParameter("cp"));
                    //String contra= request.getParameter("direccion");

                  sta.executeUpdate("update cliente set nombre='"+nombre+"', fecha='"+fecha+"', correo='"+correo+"', numerotelefono="+telefono+", direccion='"+direccion+"', cp="+cp+" where idcliente='"+id+"'");
                 request.getRequestDispatcher("indexcliente.jsp").forward(request, response);

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
