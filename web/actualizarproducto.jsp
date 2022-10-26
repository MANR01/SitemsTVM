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
                <h1> Actualizar Datos</h1>
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
                    rs=sta.executeQuery("SELECT * FROM producto where idProducto='"+id+"'");
                     while(rs.next()){
                %>
               <form action="" method="POST" autocomplete="off">
            <input id="id" name="id" type="hidden"/>
            <p>
                Nombre del producto:
                <input id="nombre" name="nombre" type="text" value="<%=rs.getString(2)%>" required/>
            </p>
            <p>
                Descripcion:
                <textarea rows="9" id="descripcion" name="descripcion" required /><%=rs.getString(3)%> </textarea>
            </p>
            <p>
                Precio:
                <input id="precio" name="precio" type="text" value="<%=rs.getString(4)%>" maxlength="8" minlength="2" required />
            </p>
            <p>
                 Modelo:
                <input id="modelo" name="modelo" type="text" value="<%=rs.getString(5)%>"  maxlength="4" minlength="4" required />
            </p>
            <p>
                Categoria: <h5>(verfique bien este campo)</h5>
                 <select  id="categoria" name="categoria">
                                <option value="deportiva">Deportiva</option>
                                <option value="trabajo">Trabajo</option>
                                <option value="custom">Custom</option>
                                
                            </select> 
            </p>
            <p>
                 Cantidad:
                 <input  name="cantidad" type="number" value="<%=rs.getString(7)%>" maxlength="5" required />
            </p>
            <button id="guardar" name="actualizar" type="submit" value="insertar">Actualizar</button>
        </form>
                <%
            }
              
         
                }
                catch(Exception e){
                System.out.println(e);
                }
                if(request.getParameter("actualizar")!=null){
                    
                    String nombre= request.getParameter("nombre");
                    String descripcion= request.getParameter("descripcion");
                    int precio= Integer.parseInt(request.getParameter("precio"));
                    int modelo= Integer.parseInt(request.getParameter("modelo"));
                    String categoria= request.getParameter("categoria");
                    int cantidad= Integer.parseInt(request.getParameter("cantidad"));

                  sta.executeUpdate("update producto set Nombre='"+nombre+"', Descripcion='"+descripcion+"', Precio="+precio+", Modelo="+modelo+", Categoria='"+categoria+"', Cantidad="+cantidad+" where idProducto='"+id+"'");
                 request.getRequestDispatcher("inventario.jsp").forward(request, response);

                    }

            
            %>
</div>

                        
          
		

 <aside class="asidelogo">
       <img class="logo" src="imagenes/registrarproducto1.png" alt="logo"> 
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