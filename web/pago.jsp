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
	<title>TVM</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="estilo1.css"/>
       </head> 
    <body>
      <%  String id=session.getAttribute("usuario").toString();

                Connection conex=null;
                Statement sta=null;
                ResultSet rs=null;
                String n=null;
                String nombre=null, direccion=null, cp=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM cliente where idcliente='"+id+"'");
                    while(rs.next()){
                    n=rs.getString(2);
                    direccion=rs.getString(6);
                    cp=rs.getString(7);
                    
                     
                    }
                
                }catch(Exception e){
                System.out.println(e);
                }
                %>
	<header> 
         <a href="indexcliente.jsp"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
         <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <!-- <li class="menu"><a class="menu" href="agregarmetodopago.html">Registrar metodo de pago</a></li>
                <li class="menu"><a class="menu" href="configurarcuenta.html">Catalogo <br>de productos</a></li>
                <li class="menu"><a class="menu" href="cerrarsesion.jsp">Cerrar sesion</a></li>-->
                <li class="menu"><a class="menu" href="categorias.jsp">Catalogo</a></li>
                
                <li><a href="mostrarfavoritos.jsp"> 
                   <button type="button" style=" background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/corazon2.png" width="50" height="50" style="margin:0;"><br>Favoritos</button></a>
                     </li>
                
                <li><a href="mostrarcarrito.jsp"> 
                   <button type="button" style="background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/carrito2.png" width="50" height="50" style="margin:0;"><br>Carrito</button></a>
                     </li>
                <table style="margin-right:50px; ">
                    
                    <tr><td><a href="perfilusuario.jsp"><img src="imagenes/usuario.png"  alt="logo" width="65px" height="60px"></a></td></tr>
                    <tr><td><a style="color: whitesmoke;
                        font-family:fantasy;
                        font-size: 14px;
                        margin: 0;
                        text-decoration:none;" href="perfilusuario.jsp"><%=n%></a></td></tr>
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
                    <div>
                        <center> <h1 style=" color: green;"> Gracias por tu compra!</h1></center>
                    </div>
<section>
    <%
                String precio= request.getParameter("precio");
                String tarjeta= request.getParameter("tarjeta");
                String productos= request.getParameter("productos");
            
                
                
                %>
                <center>
                <br>
                <h1>Detalles de la compra</h1></center>
                <table width="100%">
                    
                    <tr bgcolor="gray">
                        <th></th>
                         <th></th>
                        
                    </tr>
                    <tr>  <td><h2>Nombre del comprador:</h2></td> 
                        <td><h3><%=n%></h3></td> 
                    </tr>
                    <tr>
                          <td><h2>Enviaremos tu pedido a:</h2></td> 
                        <td><h3><%=direccion+"  "%>, CP: <%=cp%></h3></td> 
                         </tr>
                        <tr>
                              <td><h2>Productos: </h2></td> 
                              <td><h3><%=productos%></h3></td> 
                        </tr>
                         <tr>
                              <td><h2>Medio de pago: </h2></td> 
                              <td><h3><%=tarjeta%></h3></td> 
                        </tr>
                        </tr>
                        <tr>
                              <td><h2>Total : </h2></td> 
                              <td><h3 style="background-color:lightgreen;">$ <%=precio%> mxn</h3></td> 
                        </tr>
                       
                
                </table>
                      
             
</section>

                        
          
		

 <aside style=" 
    width:30%;
    height:500px;
    background-color:white;   
    float: right;
    margin: 0;">
     <h1 style="margin-top: 30px;"> Estamos preparando tu paquete, <br>lo enviaremos en unos dias :)</h1> 
     <img width="65%" height="65%" style="margin-top: 80px; margin-left:60px" src="imagenes/paquete.png" alt="logo"> 
     
     <center><a href="categorias.jsp"> <button type="buuton" style="font-family:fantasy; font-size:25px; background-color:lightgreen; color:white; text-decoration:
                         none; margin-top: 20px;">Seguir comprando</button></a></center>
   </aside>     

                 

	


</body>
</html>
