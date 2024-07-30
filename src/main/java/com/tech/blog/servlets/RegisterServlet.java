
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.MessageServlet;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");
        String cPassword = req.getParameter("confirm_password");
        String gender = req.getParameter("user_gender");
        String checkbox = req.getParameter("checkbox");
        
        PrintWriter out = res.getWriter();

        if(password.equals(cPassword)){
            
            if(checkbox!=null){
                User user = new User(name,email,password,gender);
        
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
        
                if(userdao.saveUser(user))
                {
//                    out.println("Registration Successful...");
                    
                    MessageServlet msg = new MessageServlet("Registration Successful. Please Log in","green","alert alert-success");
                    HttpSession session = req.getSession();
                    session.setAttribute("msg", msg);
                    res.sendRedirect("login_page.jsp");
                    
                }else
                {
//                      out.println("Error......");
                    
                    MessageServlet msg = new MessageServlet("Error in DataBase","red","alert alert-success");
                    HttpSession session = req.getSession();
                    session.setAttribute("msg", msg);
                    res.sendRedirect("registration_page.jsp");
                }
               }else{
//                out.println("Please accept term & conditions");

                    MessageServlet msg = new MessageServlet("Please accept term & conditions","red","alert alert-success");
                    HttpSession session = req.getSession();
                    session.setAttribute("msg", msg);
                    res.sendRedirect("registration_page.jsp");
            }
            }else{
//                out.println("Password is not matching");

                    MessageServlet msg = new MessageServlet("Password is not matching","red","alert alert-success");
                    HttpSession session = req.getSession();
                    session.setAttribute("msg", msg);
                    res.sendRedirect("registration_page.jsp");
        }

    }
}
