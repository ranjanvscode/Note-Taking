
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.entities.MessageServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/login_css.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <body>
        <!--navbar-->
        <%@ include file="navbar.jsp" %>
        
        
    <div class="main">
        <p class="sign" align="center">Sign in</p>
        
        <%
            MessageServlet msg = (MessageServlet) session.getAttribute("msg");
            
               if(msg!=null)
               {
        %>
        <!--class="<%= msg.getStyle()%>"-->
        <div  style="margin: 10px 0px 0px 0px; padding: 0px; color: <%= msg.getType()%>" align="center">
           <%= msg.getContent()%>
        </div>
        
        <%
               }
               
              session.removeAttribute("msg");

        %>
  
        <form action="loginServlet" method="post" class="form1">
            <input name="user_email" class="un " type="text" align="center" placeholder="Username">
            <input name="user_password" class="pass" type="password" align="center" placeholder="Password">
            <button type="submit" class="submit" align="center" >Sign in</button>
            <p class="forgot" align="center"><a href="#">Forgot Password?</a></p>  
            <h6 class="signup" style="padding:0 0 1.5rem 0" align="center" >Have you already an account? <a class="n" href="registration_page.jsp">Sign Up</a> </h6>
        </form>
    </div>

    </body>
</html>
