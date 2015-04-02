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
 * @author DKG
 */
public class MailAction extends ActionSupport {
    
    Connection con = Connections.conn();
    ArrayList<Mailinfo> mailinfo = new ArrayList<Mailinfo>();
    
    public ArrayList<Mailinfo> getMailinfo() {
        return mailinfo;
    }
    
    public void setMailinfo(ArrayList<Mailinfo> mailinfo) {
        this.mailinfo = mailinfo;
    }
    
    public MailAction() {
    }
    public int number =0 ;
    public String execute() throws Exception {
        
        HttpSession session = ServletActionContext.getRequest().getSession(false);        
        String User = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");
        Statement ps = con.createStatement();
        
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, sendername, time from message where receiveremail='" + email + "'");
        
        while (rs.next()) {
            number++;
            Mailinfo mail = new Mailinfo();
            
            mail.setSub(rs.getString(1));
            mail.setBody(rs.getString(2));
            mail.setImportant(rs.getString(3));
            mail.setCategories(rs.getString(4));
            mail.setStatus(rs.getString(5));
            mail.setSendername(rs.getString(6));
            mail.setTime(rs.getString(7));
            mailinfo.add(mail);
        }
        
        con.close();
        
        return "success";
    }
    
}
