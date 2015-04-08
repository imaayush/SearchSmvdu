/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class AddtocircleAction extends ActionSupport {

    public String username2;

    public String getUsername2() {
        return username2;
    }

    public void setUsername2(String username2) {
        this.username2 = username2;
    }

    public AddtocircleAction() {
    }

    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username1 = (String) session.getAttribute("username");
            Connection con = Connections.conn();
           
            LogNote.log1("Add to Circle",username2 );
            PreparedStatement stat = con.prepareStatement("insert into circle(circlename, username) values(?,?)");
            stat.setString(1, username1);
            stat.setString(2, username2);

            stat.executeUpdate();
          
                return "success";
            
            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }

    }
    public String like(){
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username1 = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            String query = "insert into likeuser(likes, username) values('" + username1 + "','" + username2 + "')";
           LogNote.log1("Liked",username2 );
            Statement st = con.createStatement();
            st.executeUpdate(query);
           

                return "success";
            
            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    
    }
}
