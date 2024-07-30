<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDataDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    UserDataDao userDataDao = new UserDataDao(ConnectionProvider.getConnection());
    User user = (User) session.getAttribute("userData");
    String tableName = "user_"+user.getId();
    
    boolean success = userDataDao.deleteTask(tableName,id);

    JSONObject json = new JSONObject();
    json.put("success", success);
    
    response.setContentType("application/json");
    out.print(json);
%>

        
      
 