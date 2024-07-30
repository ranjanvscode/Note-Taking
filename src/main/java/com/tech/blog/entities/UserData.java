/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author ranja
 */
public class UserData {
    
    private int id;
    private String title;
    private String data;
    private Timestamp postData;

    public UserData(int id, String title, String data, Timestamp postData) {
        this.id = id;
        this.title = title;
        this.data = data;
        this.postData = postData;
    }
    
    public UserData(String title, String data) {
        this.title = title;
        this.data = data;
    }
    
     public UserData(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Timestamp getPostData() {
        return postData;
    }

    public void setPostData(Timestamp postData) {
        this.postData = postData;
    }
}
