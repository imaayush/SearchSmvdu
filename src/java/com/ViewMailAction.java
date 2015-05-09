/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class ViewMailAction extends ActionSupport {
    
    private String msgid;
    private String sub;
    private String body;
    private String important;
    private String categories;
    private String status;
    private String sendername;
    private String time;
    private String senderemail;
    private String receiveremail;
    
    Connection con = Connections.conn ();
    

    public String getMsgid() {
        return msgid;
    }

    public void setMsgid(String msgid) {
        this.msgid = msgid;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSendername() {
        return sendername;
    }

    public void setSendername(String sendername) {
        this.sendername = sendername;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    public ViewMailAction() {
    }    

    public String execute() throws Exception {

        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String msgid = request.getParameter("msgid"); 
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        //System.out.println(msgid);
        setMsgid(msgid);
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, sendername, time, senderemail, receiveremail from message where idmessage=" + Integer.parseInt(msgid));
        while (rs.next()) {  
            System.out.println(msgid);
            setSub(rs.getString(1));
            setBody(rs.getString(2));
            setImportant(rs.getString(3));
            setCategories(rs.getString(4));
            setStatus(rs.getString(5));
            setSendername(rs.getString(6));
            setTime(rs.getString(7).split("\\.")[0]);
            setSenderemail(rs.getString(8));
            setReceiveremail(rs.getString(9));
            
            ps=con.createStatement();
            ps.executeUpdate("update message set receiver='Read' where idmessage=" + Integer.parseInt(msgid) + " And receivername='" + username + "'");
        }
        con.close();
        return "success";
    }    
}
