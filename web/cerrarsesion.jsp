<%-- 
    Document   : cerrarsesion
    Created on : 18/05/2022, 02:27:35 AM
    Author     : fabricas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    HttpSession cerrarsesion= request.getSession();
    cerrarsesion.removeAttribute("usuario");
    cerrarsesion.invalidate();
    System.out.println("Sesion cerrada");
    request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
    %>
</html>
