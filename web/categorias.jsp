<%@page import="javax.swing.JOptionPane"%>
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
         <a href="indexcliente.jsp"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
          <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <!-- <li class="menu"><a class="menu" href="agregarmetodopago.html">Registrar metodo de pago</a></li>
                <li class="menu"><a class="menu" href="configurarcuenta.html">Catalogo <br>de productos</a></li>
                <li class="menu"><a class="menu" href="cerrarsesion.jsp">Cerrar sesion</a></li>-->
                <li class="menu"><a class="menu" href="indexcliente.jsp">Inicio</a></li>
                <li><a href="mostrarfavoritos.jsp"> 
                   <button type="button" style=" background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/corazon2.png" width="50" height="50" style="margin:0;"><br>Favoritos</button></a>
                     </li>
                
                <li><a href="mostrarcarrito.jsp"> 
                   <button type="button" style="background-color:black; font-family:fantasy; font-size: 15px; color:white; text-decoration: none; margin:0;"> <img src="imagenes/carrito2.png" width="50" height="50" style="margin:0;"><br>Carrito</button></a>
                     </li>
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
        
        <div class="cabezerainventario">
             <form  action="" style="display: flex">
                 <p style=" color:black;">
                 Categoria:
                 <select class="categoria" id="categoria" name="categoria">
                                <option value="deportiva">Deportiva</option>
                                <option value="trabajo">Trabajo</option>
                                <option value="custom">Custom</option>
                                
                            </select> 
            </p>
                 <button name="buscador" type="submit" value="buscador" style="
  color: white;
  background-color:black;
  font-size: 15px;
  text-align: center;
  font-family: fantasy;
  border-radius: 10px;
  height:50px; 
  margin-top: 20px;
  margin-left: 0;
 
  " >  Buscar  </button>
             </form>
            <a href="categorias.jsp"><button name="reset" type="button" value="reset"style="
                      
  color: white;
  background-color:lightgreen;
  font-size: 16px;
  text-align: center;
  font-family: fantasy;
  border-radius: 10px;
  height:50px; 
  margin-top: 20px;
  margin-left: 0;
 
  " >  Limpiar  </button></a>
            <%
               
            %>
            <h1 style="padding-left: 200px">Catalogo</h1>
        
       
                
        
         
            
            
        </div>
           
        <center>
        
           
         <table  width="73%">
            
                <tr>
                     <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    
                    
                </tr>
          
            <% 
             
                String buscar=request.getParameter("categoria");
                String reset=request.getParameter("reset");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM producto");
                    if(buscar!=null){
                        rs=sta.executeQuery("SELECT * FROM producto where Categoria LIKE "+"'%"+buscar+"%'");
                    }
                    
                    
                     while(rs.next()){
                 %>
                 <tr> 
                  <th><img src="imagenes/<%=rs.getString(2)%>.jpg" width="230" height="200"><br><h3><%=rs.getString(2)%> </h3></th>
                  <th><h3>$: <%=rs.getString(4) %> mxn</h3>Modelo:<%=rs.getString(5)%><br><br>Tipo: <%=rs.getString(6) %></th>
                  <th><%=rs.getString(3) %></th>
                   
                  <th><a href="favoritos.jsp?id=<%=rs.getString(1)%>"> 
                   <button type="button" style="font-family:fantasy; font-size: 15px; color:black; text-decoration: none; margin:0;"> <img src="imagenes/corazon.png" width="30" height="30" style="margin:0;"><br>Agregar a favoritos</button></a>
                     </th>
                           
                   <th><a href="carrito.jsp?id=<%=rs.getString(1)%>"> 
                   <button type="button" style="font-family:fantasy; font-size: 15px; color:black; text-decoration: none; margin:0;"> <img src="imagenes/carrito.png" width="30" height="30" style="margin:0;"><br>Agregar al carrito</button></a>
                     </th>
                     
                           
                     
                       
                 </tr>
               
            <%
            }
                sta.close();
                rs.close();
                conex.close();
         
                }
                catch(Exception e){
                System.out.println(e);
                }
            
            %>
         </table>
        
        </center> 
     

    

</body>

</html>
