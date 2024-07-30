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
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.ServletContext;

/**
 *
 * @author ranja
 */
@MultipartConfig
public class UpdateServlet extends HttpServlet {
    
     public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password"); 
        Part part = req.getPart("user_pic");
        String imgName = part.getSubmittedFileName();
        
        PrintWriter out = res.getWriter();


                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("userData");
                String oldImgName=user.getImage();
                
                
                if(!(user.getName().equals(name) || name.isBlank()))
                {
                    user.setName(name);
                }
                
                if(!(user.getEmail().equals(email) || email.isBlank()))
                {
                   user.setEmail(email);
                }
                 
                if(!(user.getPassword().equals(password) || password.isBlank()))
                {
                   user.setPassword(password);
                }
                
                if(!imgName.isEmpty())
                {
                    user.setImage(imgName);
                }
                
                
                UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                
                if(userdao.updateUser(user))
                {
                        ServletContext context = getServletContext();
                        String uploadDirectory = context.getRealPath("/IMG");
                        
                        String oldFilePath = uploadDirectory + File.separator + oldImgName;
                        
                        if(!oldImgName.equals("profile.jpg") && !imgName.isBlank()) ImageUploader.deleteImg(oldFilePath);
                        
                        String filePath = uploadDirectory + File.separator + imgName;
                        ImageUploader.saveImg(part.getInputStream(), filePath);
                        
                        res.sendRedirect("profile_page.jsp");
                }else{
                     out.println("Not Updated");
                }
    }
}
