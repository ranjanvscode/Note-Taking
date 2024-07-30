/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.blog.entities.UserData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ranja
 */
public class UserDataDao {
    
     private Connection con;
    
    
    public UserDataDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveData(UserData userData,User user)
    {
        boolean f=false;
        
        String tableName = "user_"+user.getId();
        String query = "insert into "+tableName+" (title,data) values (?,?);";
        System.out.println(tableName);
        System.out.println(query);
        
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userData.getTitle());
            ps.setString(2, userData.getData());
            
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e){
        
            e.printStackTrace();
        }
           return f;
    }

    public List fetchData(User user)
    {
        UserData ud=null;
        List<UserData> dataList = new ArrayList<>();
        
        String tableName = "user_"+user.getId();
        String query = "SELECT * FROM "+tableName+";";
        
       try{
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);
            
            while(set.next())
            {
                ud = new UserData();
                
                ud.setId(set.getInt("id"));
                ud.setTitle(set.getString("title"));
                ud.setData(set.getString("data"));
                ud.setPostData(set.getTimestamp("created_at"));
                
                dataList.add(ud);
                
            }
       }catch(Exception e){
       
           e.printStackTrace();
       }
        
       return dataList;
    }
    
    public boolean deleteTask(String tableName,int postId)
    {
        boolean f=false;
        String query = "DELETE FROM "+tableName+" WHERE id=?;";
        
        try{
             PreparedStatement ps = con.prepareStatement(query);
             ps.setInt(1, postId);
            
             ps.executeUpdate();
             f=true;
            
        }catch(Exception e){
       
           e.printStackTrace();
       }
        
        return true;
    }
}
