/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDataDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.UserData;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ranja
 */
public class DataUpload extends HttpServlet {
    
     public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        PrintWriter out = res.getWriter();
        
         String title = req.getParameter("user_title");
         String data = req.getParameter("user_data");
         
         UserData uData = new UserData(title,data);
        
         HttpSession ss = req.getSession();
         User user = (User)ss.getAttribute("userData");
         
         UserDataDao userDataDao = new UserDataDao(ConnectionProvider.getConnection());
         userDataDao.saveData(uData, user);
         
         res.sendRedirect("profile_page.jsp");
         
         
    }
}
