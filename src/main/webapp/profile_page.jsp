

<%@page import="com.tech.blog.dao.UserDataDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="com.tech.blog.entities.User" %>


<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.UserData"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    User user = (User) session.getAttribute("userData");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <!--Jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JS/myscripts.js"></script>
        <!--Bootstraps-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!--Font Awesome-->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/login_css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <!--Start Navbar-->

        <nav class="navbar navbar-expand-lg primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="first.jsp"><span class="fa fa-desktop"></span> Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Actions
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action 1</a></li>
                                <li><a class="dropdown-item" href="#">Action 2</a></li>
                                <li><a class="dropdown-item" href="#">Action 3</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!--New Modal-->
                    <!-- Button trigger modal -->
                    <button type="button" class="btn m-0 p-0 d-flex flex-row" data-bs-toggle="modal" data-bs-target="#profileModal">
                        <image class="mt-1" src="IMG/<%= user.getImage()%>" style="width: 30px;border-radius: 50%"></<img>
                        &nbsp;
                        <!--<p class="fs-4 fw-bold m-0 p-0" ><%= user.getName()%></p>-->
                    </button>

                    &nbsp;
                </div>
            </div>
        </nav> 

        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <!--<h5 class="modal-title" id="editTaskModalLabel">Edit Task</h5>-->
                        <div align="center" class="p-2">
                            <image src="IMG/<%= user.getImage()%>" style="width: 150px;border-radius: 50%"></<img>

                            <form action="removeProfileImg" method="post">
                                <button type="submit">
                                    <span class="fa fa-trash"></span>
                                </button>
                            </form>
                        </div>

                        <div align="center" class="p-2">
                            <h3><%=user.getName()%></h3>
                        </div>
                    </div>


                    <!--Profile-->
                    <div class="modal-body">
                        <div id="profile-detail">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>ID: </td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Email: </td>
                                        <td><%=user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Password: </td>
                                        <td> null </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Gender: </td>
                                        <td> <%=user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Registration Date: </td>
                                        <td> <%=new Date(user.getDateTime().getTime())%></td>
                                    </tr>
                                </tbody>
                            </table>  
                        </div>   


                        <!--Profile Editing-->
                        <div id="profile-edit" style="display: none">
                            <form action="UpdateServlet" method="post" enctype="multipart/form-data" >  
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>ID: </td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Name: </td>
                                            <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Email: </td>
                                            <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Password: </td>
                                            <td><input class="form-control" type="password" name="user_password" placeholder="Enter new password"></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Profile Pic: </td>
                                            <td><input class="form-control" type="file" name="user_pic" ></td>
                                        </tr>

                                    </tbody>
                                </table> 

                                <div align="center" >
                                    <button type="submit" class="btn btn-primary" >Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--END Profile editing-->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editBtn">Edit</button>
                        <div id="logout-btn" >
                            <form action="LogoutServlet" method="post" >
                                <!--<li class="d-flex nav-item" class="nav-link" >-->
                                <button class="btn btn-outline-success" type="submit" >Log Out</button>
                                <!--</li>-->
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Create task model box --> 
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary m-5" data-bs-toggle="modal" data-bs-target="#createExampleModal">
            Create
        </button>

        <!-- Modal -->
        <div class="modal fade" id="createExampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="dataUpload" method="post">
                        <div class="modal-body">
                            <div>
                                <input class="form-control mb-3" type="text" name="user_title" placeholder="Title">
                            </div>
                            <textarea class="form-control mb-2" name="user_data" class="form-control" rows="10" placeholder="Task" style="resize: none;">

                            </textarea>
                        </div>
                        <div class="modal-footer">
                            <div align="center" >
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" >Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div> 


        <%-- Post Content--%>

        <%
            UserDataDao userDataDao = new UserDataDao(ConnectionProvider.getConnection());
            List<UserData> dataList = userDataDao.fetchData(user);

            if (dataList.isEmpty()) {

                out.println("<p class='display-5 text-center' >No Post</p>");
            }

            for (UserData ud : dataList) {


        %>
        <div class="container"> 
            <div class="row align-items-start">
                <div class="card m-2 col" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title"><%= ud.getTitle()%></h5>
                        <p  class="card-text"><%= ud.getData()%></p>
                        <a href="#"   class="card-link edit-button" data-id="<%= ud.getId()%>" >Edit</a>
                        <a href="#"   class="card-link delete-button" data-id="<%= ud.getId()%>" >Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %> 



        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 


        <script>
            $(document).ready(function () {
                $('.delete-button').on('click', function (e) {
                    e.preventDefault();
                    var id = $(this).data('id');
                    if (confirm('Are you sure you want to delete this post?')) {
                        $.ajax({
                            url: 'dataUpdate.jsp', // Endpoint to delete the data
                            type: 'POST',
                            data: {id: id},
                            success: function (response) {
                                if (response.success) {
                                    location.reload(); // Reload the page to see changes
                                } else {
                                    alert('Failed to delete data');
                                }
                            }
                        });
                    }
                });
            });
        </script>

    </body>
</html>
