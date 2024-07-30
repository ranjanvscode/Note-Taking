
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.dao.UserDataDao;
import com.tech.blog.entities.MessageServlet;
import com.tech.blog.entities.User;
import com.tech.blog.entities.UserData;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");
        
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                User user = userdao.loginUser(email,password);
                
                if(user==null)
                {   
                    MessageServlet msg = new MessageServlet("Invalid Detail","red","alert alert-danger");
                    HttpSession session = req.getSession();
                    session.setAttribute("msg", msg);
                    res.sendRedirect("login_page.jsp");
                    
                }else
                {
                    HttpSession session = req.getSession();
                    session.setAttribute("userData", user);
                    res.sendRedirect("profile_page.jsp");
                }
    }
    
}
