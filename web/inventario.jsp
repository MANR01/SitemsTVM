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
	<header> 
         <a href="indexadmin.jsp"><img class="logo" src="imagenes/logo.png"  alt="logo"></a>  
         <nav class="menu">
         <!--<nav style="margin-top:15px; float:right;"> -->
         <ul class="menu">
           <!--<ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color:black; ">-->
	
    
                <li class="menu"><a class="menu" href="indexadmin.jsp">Inicio</a></li>
		<!--<li class="menu" ><a class="menu" href="registrarusuario.jsp">Registrarte</a></li>-->
		
                
               
               
</ul>
</nav>
</header>
        
        <div class="cabezerainventario" >
             <form  action="" style="display: flex;" >
                 <input type="text" name="buscador"  style="
  font-size: 15px;
  height: auto;
  margin-top:20px;
  padding: 0;
  width: 100%;
  background-color:lightblue;
  color:black;
  border-radius: 10px;
 
  ">
                 <button name="buscador" type="submit" value="buscador"style="
                      
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
            <a href="inventario.jsp"><button name="reset" type="button" value="reset"style="
                      
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
            <h1 style="padding-left: 270px">Inventario</h1>
        
       
            <a style="padding-left: 490px; font-family:fantasy; font-size: 20px; color: black; "href="registrarproducto.jsp" > 
                <img  src="imagenes/agregar.png" width="50" height="50"><br>AGREGAR</a>
                
        
         
            
            
        </div>
           
        <center>
        
           
         <table  width="95%">
            
                <tr bgcolor="lightblue">
                     <th>Foto</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Modelo</th>
                    <th>Categoria</th>
                    <th>Cantidad</th>
                    <th>Actualizar</th>
                    <th>Eliminar</th>
                    
                </tr>
          
            <% 
                Connection conex=null;
                Statement sta=null;
                ResultSet rs=null;
                String buscar=request.getParameter("buscador");
                String reset=request.getParameter("reset");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM producto");
                    if(buscar!=null){
                        rs=sta.executeQuery("SELECT * FROM producto where Nombre LIKE "+"'%"+buscar+"%'");
                    }
                    
                    
                     while(rs.next()){
                 %>
                 <tr> 
                      <th><img src="imagenes/<%=rs.getString(2)%>.jpg" width="170" height="150"></th>
                      <th><%=rs.getString(2) %></th>
                      <th><%=rs.getString(3) %></th>
                      <th><%=rs.getString(4) %></th>
                      <th><%=rs.getString(5) %></th>
                      <th><%=rs.getString(6) %></th>
                      <th><%=rs.getString(7) %></th>
                      <th><a href="actualizarproducto.jsp?id=<%=rs.getString(1)%>"> 
                      <img src="imagenes/actualizar.png" width="40" height="35"></a></th>
                      <th><a href="eliminarproducto2.jsp?id=<%=rs.getString(1)%>"> 
                      <img src="imagenes/eliminar.png" width="42" height="37"></a></th>
                       
                       
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
