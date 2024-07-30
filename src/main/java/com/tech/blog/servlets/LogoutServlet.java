
package com.tech.blog.servlets;

import com.tech.blog.entities.MessageServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");
        
                    HttpSession session = req.getSession();
                    session.removeAttribute("userData");
                            
                    MessageServlet msg = new MessageServlet("Log out Successfully","green","alert alert-success");
                    session.setAttribute("msg", msg);
                    res.sendRedirect("login_page.jsp");
    }
}
