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
    Connection con = Connections.conn();

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
        String query = "select email from user where username='" + User + "'";

        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {

                setSenderemail(rs.getString("Email"));
            }
            setImportant("No");
            setCategories("Primary");
            setReceiverstatus("Unread");
            setSenderstatus("Send");
            String time ="10:00 Pm";
            query = "insert into message(senderemail, receiveremail, sub, body, senderstatus, important, categories, receiver ,sendername,time) values('" + senderemail + "','" + receiveremail + "', '" + sub + "', '" + body + "', '" + senderstatus + "', '" + important + "','" + categories + "','" + receiverstatus + "','"+User+"','"+time+"')";

            try {
                st = con.createStatement();
                st.executeUpdate(query);
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
