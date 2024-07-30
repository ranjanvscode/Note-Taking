
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDao {

    private Connection con;
    
    
    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        
        try{
            
            String query = "insert into user (name,email,password,gender) values (?,?,?,?);";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            
            ps.executeUpdate();
            
            f=true;
        }catch(Exception e)
        {
            System.out.println(e);
        }
        
        
        User userID = loginUser(user.getEmail(),user.getPassword());
        createUserTable(userID.getId());
        
        return f;
        
        
    }
    
     private void createUserTable(int userId) {
        String tableName = "user_" + userId;
        String query = "CREATE TABLE " + tableName + " ("
                + "id INT AUTO_INCREMENT PRIMARY KEY,"
                + "title VARCHAR(500),"
                + "data TEXT,"
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                + ")";
        try{
           Statement st = con.createStatement();
            st.executeUpdate(query);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public User loginUser(String userEmail,String userPassword)
    {
        User user2=null;
        
        try{
            
            String query = "select * from user where email=? and password=?;";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);
            
            ResultSet rs = ps.executeQuery();
                            
            if(rs.next())
            {
                user2 = new User();
                
                user2.setId(rs.getInt("id"));
                user2.setName(rs.getString("name"));
                user2.setEmail(rs.getString("email"));
                user2.setPassword(rs.getString("password"));
                user2.setGender(rs.getString("gender"));
                user2.setImage(rs.getString("image"));
                user2.setDateTime(rs.getTimestamp("rdate"));

                return user2;
            }
           
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user2;
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        
        try{
            
            String query = "update user set name=?,email=?,password=?, image=? where id=?;";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getImage());
            ps.setInt(5, user.getId());
            
            ps.executeUpdate();
            
            f=true;
        }catch(Exception e)
        {
            System.out.println(e);
        }
        return f;
    }
    
    public void removeProfile(User user)
    {
        try{
            
            String query = "update user set image=? where id=?;";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getImage());
            ps.setInt(2, user.getId());
            
            ps.executeUpdate();
            
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}
