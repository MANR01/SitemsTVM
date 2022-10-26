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
      
        
       <a href="indexadmin.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"> </a>
<nav class="menu">
     
    <ul class="menu">
	
    <li class="menu"><a class="menu" href="indexadmin.jsp">Inicio</a></li>
</ul>
</nav>

</header>

<div class="contenedorregistroproduct">
                <h1>       Registrar producto</h1>
               <form action="registrarproducto.jsp" method="POST" autocomplete="off">
            <input id="id" name="id" type="hidden"/>
            <p>
                Nombre:
                <input id="nombre" name="nombre" type="text" autocomplete="off" required />
            </p>
             <p>
                Descripcion:
                <textarea rows="9" id="descripcion" name="descripcion" required /></textarea>
            </p>
            <p>
                Precio:
                <input id="precio" name="precio" type="text" required  maxlength="8"/>
            </p>
            <p>
                 Modelo:
                 <input id="modelo" name="modelo" type="text" minlength="4" maxlength="4"required />
            </p>
            <p>
                 Categoria:
                 <select  id="categoria" name="categoria">
                                <option value="deportiva">Deportiva</option>
                                <option value="trabajo">Trabajo</option>
                                <option value="custom">Custom</option>
                                
                            </select> 
                  <p>
                 Cantidad:
                 <input  name="cantidad" type="number" minlength="2" placeholder="1" required/>
            </p>
            </p>
            <button id="guardar" name="guardar" type="submit" value="insertar">guardar</button>
        </form>
                <%
                    if(request.getParameter("guardar")!=null){
                    int id=0;
                    String nombre= request.getParameter("nombre");
                    String descripcion= request.getParameter("descripcion");
                    int precio= Integer.parseInt(request.getParameter("precio"));
                    int modelo= Integer.parseInt(request.getParameter("modelo"));
                    String categoria= request.getParameter("categoria");
                    String cantidad= request.getParameter("cantidad");
                    
                    Connection conex=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    sta.executeUpdate("insert into producto values("+id+",'"+nombre+"','"+descripcion+"',"+precio+","+modelo+",'"+categoria+"','"+cantidad+"')");
                    request.getRequestDispatcher("indexadmin.jsp").forward(request, response);
                    
                    }
                    catch(Exception e){
                      System.out.println(e);
                       }
                    }
                %>
</div>

                        
          
		

 <aside class="asidelogo">
       <img class="logo" src="imagenes/registrarproducto1.png" alt="logo"> 
   </aside>     

                 
<footer>
  <ul> 
            <li><p> CONTACTANOS</p></li>
            <li><a><img  src="imagenes/fblogo.png" alt="logofb"> </a></li>
            <li><a><img  src="imagenes/whatsapp.png" alt="logowa"> </a></li>
            <li><a><img  src="imagenes/email.png" alt="logofb"> </a></li>
            <li><a><img  src="imagenes/twitter.png" alt="logowa"> </a></li>
            <li><a><img  src="imagenes/instagram.png" alt="logofb"> </a></li>
            
  </ul>
    </footer>
	


</body>
</html>
