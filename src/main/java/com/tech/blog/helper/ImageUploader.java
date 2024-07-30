/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author ranja
 */
public class ImageUploader {
    
    public static void saveImg(InputStream is,String filePath)
    {
        try{
             byte[] arr = new byte[is.available()];
             is.read(arr);
             
             FileOutputStream fileStream = new FileOutputStream(filePath);
             fileStream.write(arr);
             fileStream.flush();
             fileStream.close();
             
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static void deleteImg(String filePath)
    {
        try{
            
            File file = new File(filePath);
            file.delete();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
