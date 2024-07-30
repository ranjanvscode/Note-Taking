
<%@page import="com.tech.blog.entities.MessageServlet"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="CSS/registration_css.css" rel="stylesheet" type="text/css"/>
         <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <!--navbar-->
            <%@ include file="navbar.jsp" %>
       
 
    <div class="wrapper">
    <h2>Registration</h2>
    
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
        
    <form action="RegisterServlet" method="post">
        <div class="input-box">
            <input type="text" name="user_name" placeholder="Enter your name" required>
        </div>
        <div class="input-box">
            <input type="text" name="user_email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <input type="password" name="user_password" placeholder="Create password" required>
        </div>

        <div class="input-box">
            <input type="password" name="confirm_password" placeholder="Confirm password" required>
        </div>

        <div class="container">
		<label>
			<input type="radio" name="user_gender" value="male" checked/>
			<span>Male</span>
		</label>
		<label>
			<input type="radio" name="user_gender" value="female" />
			<span>Female</span>
		</label>
        </div>


        <div class="policy checkbox-wrapper-34">
            <input class='tgl tgl-ios' id='toggle-34' name="checkbox" type="checkbox" value="accepted" name="condition">
            <label class='tgl-btn' for='toggle-34'></label>
            <h3> I accept all terms & condition </h3>
        </div>
        <div class="input-box button">
            <input type="Submit" value="Register Now">
        </div>
        <div class="text">
            <h3>Already have an account? <a href="login_page.jsp">Login now</a></h3>
        </div>
    </form>
</div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
<!--    
     <div class="wrapper form-div">
    <h2>Registration</h2>
    <form action="RegServlet" method="post">
        <div class="input-box">
            <input type="text" name="user_name" placeholder="Enter your name" required>
        </div>
        <div class="input-box">
            <input type="text" name="user_email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <input type="password" name="user_password" placeholder="Create password" required>
        </div>
        
        <div class="input-box">
            <input type="password" placeholder="Confirm password" required>
        </div>
        
       <div class="container">
	<form>
		<label>
			<input type="radio" name="user_gender" checked/>
			<span>Male</span>
		</label>
		<label>
			<input type="radio" name="user_gender"/>
			<span>Female</span>
		</label>
	</form>
        </div>
        
        <div class="policy">
            <input type="checkbox" value="accepted" name="condition">
            <h3>I accept all terms & condition</h3>
        </div>
        <div class="input-box button">
            <input type="Submit" value="Register Now">
        </div>
        <div class="text">
            <h3>Already have an account? <a href="login_page.jsp">Login now</a></h3>
        </div>
    </form>
</div>-->
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    </body>
</html>
