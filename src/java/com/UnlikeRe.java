/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class UnlikeRe extends ActionSupport {
    
    private String idfiles, notification;

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getIdfiles() {
        return idfiles;
    }

    public void setIdfiles(String idfiles) {
        this.idfiles = idfiles;
    }
    
    public UnlikeRe() {
    }
    
    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            String query = "delete from notifications where notification='Liked' AND username='" + username + "' AND idfiles=" + Integer.parseInt(idfiles);
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
