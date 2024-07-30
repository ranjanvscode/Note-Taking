/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ImageUploader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ranja
 */
public class RemoveProfileImg  extends HttpServlet{
    
     public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("userData");
                String oldImgName = user.getImage();
                user.setImage("profile.jpg");
                
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                userdao.removeProfile(user);
             
                        ServletContext context = getServletContext();
                        String uploadDirectory = context.getRealPath("/IMG");
                        String oldFilePath = uploadDirectory + File.separator + oldImgName;
                        if(!oldImgName.equals("profile.jpg")) ImageUploader.deleteImg(oldFilePath);
                        
                        res.sendRedirect("profile_page.jsp");
             
    }
    
}
