/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class LikeRe extends ActionSupport {

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

    public LikeRe() {
    }

    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            setNotification("Liked");
            Timestamp time = new Timestamp(System.currentTimeMillis());
            String query1 = "insert into notifications(notification, idfiles,username,notificationdatetime) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, notification);
            ps.setString(2, idfiles);
            ps.setString(3, username);
            ps.setTimestamp(4, time);
            ps.executeUpdate();
            return "success";

            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String recommended() {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            setNotification("Recommended");            
            Timestamp time = new Timestamp(System.currentTimeMillis());
            String query1 = "insert into notifications(notification, idfiles,username,notificationdatetime) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, notification);
            ps.setString(2, idfiles);
            ps.setString(3, username);
            ps.setTimestamp(4, time);
            ps.executeUpdate();
            return "success";


            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }

    }

}
