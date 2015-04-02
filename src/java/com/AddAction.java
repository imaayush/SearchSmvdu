/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class AddAction extends ActionSupport {
     Connection con = Connections.conn();
    ArrayList<People> people = new ArrayList<People>();

   
    public ArrayList<People> getPeople() {
        return people;
    }

    public void setPeople(ArrayList<People> people) {
        this.people = people;
    }
    public AddAction() {
    }
    
    public String execute() throws Exception {
         HttpSession session = ServletActionContext.getRequest().getSession(false);        
               
        String username = (String) session.getAttribute("username");
        Statement ps = con.createStatement();
        
        ResultSet rs = ps.executeQuery("select name ,email,image from user where username!='"+username+"'");
        
        while (rs.next()) {
            
            People p = new People();
            
            p.setName(rs.getString(1));
            p.setEmail(rs.getString(2));
            p.setPhoto(rs.getString(3));
            
            people.add(p);
        }
        
        con.close();
        
        return "success";
    }
    
}
