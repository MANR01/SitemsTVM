<%@page import="javax.crypto.ExemptionMechanismException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                Statement sta2=null;
                ResultSet rs2=null;
                 Statement sta3=null;
                ResultSet rs3=null;
                String n=null, n2=null, terminal="",terminal2="Tarjeta con terminacion: ";
               
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                   
                    sta3=conex.createStatement();
                    rs3=sta3.executeQuery("SELECT numerotarjeta FROM metododepago where idclientemp='"+id+"'");
                    while(rs3.next()){
                    n2=rs3.getString(1);
                    }
                    
                       terminal = n2.substring(n2.length() - 4);
                        System.out.println(terminal);
                        
                        if(n2!=null){
                            
                            terminal2=terminal2+""+terminal;
                        }
                        
                        
                }catch(Exception e){
                terminal2="-";
                }
                
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
          <ul class="menu">
          
                <li class="menu"><a class="menu" href="indexcliente.jsp">Inicio</a></li>
                <table style="margin-right:50px; ">
                    
                    <tr><td><a href="perfilusuario.jsp"><img src="imagenes/usuario.png"  alt="logo" width="65px" height="60px"></a></td></tr>
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
        
        <div class="cabezerainventario" >
     
            <h1 style="padding-left: 43%;">Carrito de compras</h1>
           
             
             
        
            
        
         
            
            
        </div>
           
        <center>
        
           
         
          
            <% 
             
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    sta2=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM carrito where idcarritocliente='"+id+"' group by nombrep");
                    
                    
                   
                  %>
                  <table  width="70%">
            
                <tr >
                     <th></th>
                    <th ></th>
                    
                    
                    
                </tr>
            
            
            <%      
               
              String nd=null, producs="";
              int precio,canti,preciof,pagofinal=0;
              while(rs.next()){
              String idproduc=rs.getString(2);
              rs2=sta2.executeQuery("SELECT COUNT(*) FROM carrito where idcarritocliente='"+id+"' and idproducto='"+idproduc+"'");
              while(rs2.next()){
              nd=rs2.getString(1);
              }
              canti=Integer.parseInt(nd);
              precio=Integer.parseInt(rs.getString(5));
              preciof=canti*precio;
                    pagofinal=pagofinal+preciof;
                    producs=producs+rs.getString(3)+",";
                 %> 
                 <tr> 
                     <th><img src="imagenes/<%=rs.getString(3)%>.jpg" width="210px" height="180px"><br><%=rs.getString(3)%></th>
                     <th><h3>$: <%=preciof%> mxn </h3>
                         Tipo: <%=rs.getString(7) %><br>
                         
                         Cantidad: <%=canti%><br>
                         
                         <a  href="eliminarcarrito.jsp?nombre=<%=rs.getString(3)%>"> 
                             <button type="button" style="font-family:fantasy; font-size: 15px; color:red; text-decoration: none; margin:0;"> <img src="imagenes/eliminarcarrito.png" width="30" height="30" style="margin:0;"><br>Quitar del<br>carrito</button></a>
                          
                     </th>
                   
                     
                    
                     
                       
                       
                 </tr>
               
            <%
                
            }  
            %> <tr> 
                     <th>  <h3 style="padding-left: 1%; color: black">Metodo de pago seleccionado:</h3>
               <h4 style="padding-left: 3%; background-color:lightgreen; "><%=terminal2%></h4>
                            </th>
               <th><br><h2> Total:</h2><h1> <%=pagofinal%> mxn</h1>
                   
                   <form action="pago.jsp"> 
                       <input type="hidden" name="precio" value="<%=pagofinal%>"/>
                         <input type="hidden" name="tarjeta" value="<%=terminal2%>"/>
                        <input type="hidden" name="productos" value="<%=producs%>"/>
                   
                   <button type="submit" style="font-family:fantasy; font-size: 15px; color:green; text-decoration:
                      none; margin:0;"> <img src="imagenes/pagarcarrito.png" width="30" height="30" style="margin:0;">
                       <br>Pagar carrito</button></form>
                     </th>
                   </tr>
                   
                   
                   
                   
                   <%
                     
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

