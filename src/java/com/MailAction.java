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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
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

    public String execute() throws Exception {

        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String email = (String) session.getAttribute("email");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, sendername, time, idmessage, receiveremail,starred from message where receiveremail='" + email + "' ORDER BY time DESC");
        while (rs.next()) {
            Mailinfo mail = new Mailinfo();
            mail.setSub(rs.getString(1));
            mail.setBody(rs.getString(2));
            mail.setImportant(rs.getString(3));
            mail.setCategories(rs.getString(4));
            mail.setStatus(rs.getString(5));
            mail.setSendername(rs.getString(6));
            mail.setTime(rs.getString(7).split("\\.")[0]);
            mail.setIdmessage(rs.getString(8));
            mail.setMail(rs.getString(9));
            mail.setStarred(rs.getString(10));
            mailinfo.add(mail);
        }
        con.close();
        return "success";
    }

    public String sentmail() throws SQLException {
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String User = (String) session.getAttribute("username");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, receivername, time,idmessage,receiveremail,starred from message where sendername='" + User + "' ORDER BY time DESC");
        while (rs.next()) {
            Mailinfo mail = new Mailinfo();
            mail.setSub(rs.getString(1));
            mail.setBody(rs.getString(2));
            mail.setImportant(rs.getString(3));
            mail.setCategories(rs.getString(4));
            mail.setStatus(rs.getString(5));
            mail.setSendername(rs.getString(6));
            mail.setTime(rs.getString(7).split("\\.")[0]);
            mail.setIdmessage(rs.getString(8));
            mail.setMail(rs.getString(9));
            mail.setStarred(rs.getString(10));
            mailinfo.add(mail);
        }
        con.close();
        return "success";
    }

    public String importantmail() throws Exception {

        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String email = (String) session.getAttribute("email");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, receivername, time,idmessage,receiveremail,starred from message where receiveremail='" + email + "' AND important='Yes' ORDER BY time DESC");
        while (rs.next()) {
            Mailinfo mail = new Mailinfo();
            mail.setSub(rs.getString(1));
            mail.setBody(rs.getString(2));
            mail.setImportant(rs.getString(3));
            mail.setCategories(rs.getString(4));
            mail.setStatus(rs.getString(5));
            mail.setSendername(rs.getString(6));
            mail.setTime(rs.getString(7).split("\\.")[0]);
            mail.setIdmessage(rs.getString(8));
            mail.setMail(rs.getString(9));
            mail.setStarred(rs.getString(10));
            mailinfo.add(mail);
        }
        con.close();
        return "success";
    }

    public String starredmail() throws Exception {

        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String email = (String) session.getAttribute("email");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select  sub, body, important, categories, receiver, receivername, time,idmessage,receiveremail,starred from message where receiveremail='" + email + "' AND starred='Yes' ORDER BY time DESC");
        while (rs.next()) {
            Mailinfo mail = new Mailinfo();
            mail.setSub(rs.getString(1));
            mail.setBody(rs.getString(2));
            mail.setImportant(rs.getString(3));
            mail.setCategories(rs.getString(4));
            mail.setStatus(rs.getString(5));
            mail.setSendername(rs.getString(6));
            mail.setTime(rs.getString(7).split("\\.")[0]);
            mail.setIdmessage(rs.getString(8));
            mail.setMail(rs.getString(9));
            mail.setStarred(rs.getString(10));
            mailinfo.add(mail);
        }
        con.close();
        return "success";
    }

    public String updateimportantmail() throws Exception {

        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String idmessage = request.getParameter("idmessage");
        String query;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select important from message where idmessage='" + idmessage + "'");
        while (rs.next()) {
            st = con.createStatement();
            if (rs.getString(1).equals("No")) {
                query = "update message set important='Yes' where idmessage='" + idmessage + "'";
            } else {
                query = "update message set important='No' where idmessage='" + idmessage + "'";
            }
            st.executeUpdate(query);
        }
        return "success";
    }

    public String updatestarredmail() throws Exception {

        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String idmessage = request.getParameter("idmessage");
        String query;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select starred from message where idmessage='" + idmessage + "'");
        while (rs.next()) {
            st = con.createStatement();
            if (rs.getString(1).equals("No")) {
                query = "update message set starred='Yes' where idmessage='" + idmessage + "'";
            } else {
                query = "update message set starred='No' where idmessage='" + idmessage + "'";
            }
            st.executeUpdate(query);
        }
        return "success";
    }

    public String allread() throws Exception {

        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String email = (String) session.getAttribute("email");
        Statement st = con.createStatement();
        String query = "update message set receiver='Read' where receiveremail='" + email + "'";
        st.executeUpdate(query);

        return "success";
    }
}
