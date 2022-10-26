
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="shortcut icon" href="imagenes/icono.png" />
	<title>TVM</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="estilo3.css"/>
</head>
<body>
	


    <header> 
     
<a href="index.jsp"> <img class="logo" src="imagenes/logo.png" alt="logo"> </a>
 <nav class="menu">
     
    <ul class="menu">
	
        <li class="menu"><a class="menu" href="index.jsp">Continuar sin<br> iniciar sesion</a></li>
		
               
               
</ul>
</nav>
</header>
    
    
    

<div class="contenedorregistroproduct">
    <center> <h1> Iniciar sesión </h1> <br>
  
  
      <form class="login-form" action="iniciarsesion.jsp" method="post">
    Usuario:<br>
    <input type="text" placeholder="Correo electronico" name="correo" required/>
      <br>
      Contraseña:<br>
      <input type="password" placeholder="Contraseña" name="contra" required/>

             
         <center>
             <button type="submit" name="enviar" >Enviar</button>
</center>
      </form>
      <%
          
                   
                   
                          
          if(request.getParameter("enviar")!=null){
                    String correo= request.getParameter("correo");
                    String contra= request.getParameter("contra");
                    String admin="admin";
                    String root="root";
                    String ad="Administrador";
                    Connection conex=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    String s=null,c=null, nombre=null,id=null;
                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conex= DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendatvm", "root", "Base1209@");
                    System.out.println("conexion exitosa");
                    sta=conex.createStatement();
                    rs=sta.executeQuery("SELECT * FROM cliente WHERE (correo='"+correo+"') or (contraseña='"+contra+"')");
                     while(rs.next()){
                        s=rs.getString(4);
                        c=rs.getString(8);
                        nombre=rs.getString(2);
                        id=rs.getString(1);
                        
                    }
                     
                    if(s.equals(correo) && c.equals(contra) ){
                        if(s.equals(admin) && c.equals(root)){
                    System.out.println("sesion correcta super usuario ");
                    HttpSession nuevasesion=request.getSession();
                    nuevasesion.setAttribute("usuario",ad);
                    request.getRequestDispatcher("indexadmin.jsp").forward(request, response);
                    }
                    System.out.println("sesion correcta ");
                    HttpSession nuevasesion=request.getSession();
                    nuevasesion.setAttribute("usuario",id);
                    request.getRequestDispatcher("indexcliente.jsp").forward(request, response);
                    }
                   
                    else if(s!=correo || c!=contra){
                        System.out.println("datos erroneos ");
                        %> <script >
                            window.alert("Datos erroreos");
                          </script>

                                    <%
                        //request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
                    }
                   
                    
                    }
                    catch(Exception e){
                      System.out.println(e);
                       }
                    
          }
      %>
      
    
      <p class="p1">¿Aun no te has registrado? <a class="a1" href="registrarusuario.jsp">Crear una cuenta</a></p>
       
  
        </center>
</div>
 <aside class="asidelogo">
       <img class="logo" src="imagenes/iniciarsesion1.png" alt="logo"> 
   </aside>  
<footer>
  <ul> 
      <li><p style="color: whitesmoke;" > CONTACTANOS</p></li>
            <li><a href="https://www.facebook.com/"><img  src="imagenes/fblogo.png" alt="logofb"> </a></li>
            <li><a href="https://web.whatsapp.com/"><img  src="imagenes/whatsapp.png" alt="logowa"> </a></li>
            <li><a href="https://www.gmail.com/"><img  src="imagenes/email.png" alt="logofb"> </a></li>
            <li><a href="https://www.twitter.com/"><img  src="imagenes/twitter.png" alt="logowa"> </a></li>
            <li><a href="https://www.instagram.com/"><img  src="imagenes/instagram.png" alt="logofb"> </a></li>
            
  </ul>
    </footer>







</body>
</html>
