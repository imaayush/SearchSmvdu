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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class SendemailAction extends ActionSupport {

    public SendemailAction() {
    }

    private String senderemail;
    private String receiveremail;
    private String sub;
    private String body;
    private String senderstatus;
    private String receiverstatus;
    private String important;
    private String categories;
    private String receiverUser;
    Connection con = Connections.conn();

    public String getReceiverUser() {
        return receiverUser;
    }

    public void setReceiverUser(String receiverUser) {
        this.receiverUser = receiverUser;
    }

    public String getSenderemail() {
        return senderemail;
    }

    public void setSenderemail(String senderemail) {
        this.senderemail = senderemail;
    }

    public String getReceiveremail() {
        return receiveremail;
    }

    public void setReceiveremail(String receiveremail) {
        this.receiveremail = receiveremail;
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getSenderstatus() {
        return senderstatus;
    }

    public void setSenderstatus(String senderstatus) {
        this.senderstatus = senderstatus;
    }

    public String getReceiverstatus() {
        return receiverstatus;
    }

    public void setReceiverstatus(String receiverstatus) {
        this.receiverstatus = receiverstatus;
    }

    public String getImportant() {
        return important;
    }

    public void setImportant(String important) {
        this.important = important;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String User = (String) session.getAttribute("username");        
        PreparedStatement ps;
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select email from user where username='" + User + "'");
            while (rs.next()) {
                setSenderemail(rs.getString(1));
            }
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select username from user where Email='" + receiveremail + "'");
            while (rs1.next()) {
                setReceiverUser(rs1.getString(1));
            }
            
            setImportant("No");
            setCategories("Primary");
            setReceiverstatus("Unread");
            setSenderstatus("Send");
            Timestamp time = new Timestamp(System.currentTimeMillis());
            System.out.println(time);
            String query = "insert into message(senderemail, receiveremail, sub, body, senderstatus, important, categories, receiver ,sendername,receivername,time) values(?,?,?,?,?,?,?,?,?,?,?)";

            try {
                ps = con.prepareStatement(query);
                ps.setString(1, senderemail);
                ps.setString(2, receiveremail);
                ps.setString(3, sub);
                ps.setString(4, body);
                ps.setString(5, senderstatus);
                ps.setString(6, important);
                ps.setString(7, categories);
                ps.setString(8, receiverstatus);
                ps.setString(9, User);
                ps.setString(10, receiverUser);
                ps.setTimestamp(11, time);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(RegisterAction.class.getName()).log(Level.SEVERE, null, ex);
            }
            return "success";

        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
        return "fail";

    }

}
