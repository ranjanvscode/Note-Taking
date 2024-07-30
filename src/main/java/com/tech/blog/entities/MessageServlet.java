
package com.tech.blog.entities;

public class MessageServlet {
    
    private String content;
    private String type;
    private String style;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public MessageServlet(String content, String type, String style) {
        this.content = content;
        this.type = type;
        this.style = style;
    }
    
    public MessageServlet() {
       
    }
    
    
}
