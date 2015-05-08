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
 * @author DKG
 */
public class SetnewtimestampAction extends ActionSupport {
    
    public SetnewtimestampAction() {
    }
    
    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        Connection con = Connections.conn();
        try {
            String query = "update notification_status set notificationtime=? where username=?";            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(2, username);
            ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return "success";
    }    
}
