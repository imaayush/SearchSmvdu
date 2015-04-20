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
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author knight
 */
public class loginAction extends ActionSupport implements SessionAware {

    private String username;
    private String password;
    private SessionMap<String, Object> sessionMap;
    String searchtext,Autostr;

    public String getAutostr() {
        return Autostr;
    }

    public void setAutostr(String Autostr) {
        this.Autostr = Autostr;
    }
    
    Connection con = Connections.conn();
    ArrayList<Notification> note = new ArrayList<Notification>();

    public String getSearchtext() {
        return searchtext;
    }

    public void setSearchtext(String searchtext) {
        this.searchtext = searchtext;
    }

    public ArrayList<Notification> getNote() {
        return note;
    }

    public void setNote(ArrayList<Notification> note) {
        this.note = note;
    }

    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = (SessionMap<String, Object>) sessionMap;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void validate() {

        String query = "select Password from user where UserName='" + username + "'";
        Connection con = Connections.conn();
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                if (!rs.getString(1).equals(password)) {
                    addActionMessage("Worng Password...!!!");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }

    }

    @Override
    public String execute() throws Exception {

        String query = "select Password ,Email from user where UserName='" + username + "'";
        Connection con = Connections.conn();
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                if (!rs.getString(1).equals(password)) {
                    return "fail";
                } else {
                    sessionMap.put("email", rs.getString(2));
                    sessionMap.put("username", username);
                    selectcircle();
                    return "success";
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }

        return "fail";
    }

    public String selectcircle() {
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username1 = (String) session.getAttribute("username");
        Connection con = Connections.conn();
        String query = "select DISTINCT  notification,notifications.username,files.username ,notifications.idfiles,filedescription,filetags,filename,notificationdatetime,image from circle inner join notifications on notifications.username=circle.username inner join files on notifications.idfiles=files.idfiles inner join user  on circle.username=user.username where circle.circlename='" + username1 + "'";
        try {

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(query);

            while (rs.next()) {
                Notification n = new Notification();
                n.setNotifications(rs.getString(1));
                n.setUsername(rs.getString(2));
                n.setFileusername(rs.getString(3));
                n.setFileid(rs.getString(4));
                n.setFiledis(rs.getString(5));
                n.setFiletags(rs.getString(6));
                n.setFilename(rs.getString(7));
                String s = rs.getString(8);
                String s1[] = s.split("\\.");
                n.setDatetime(s1[0]);
                n.setImage(rs.getString(9));
                note.add(n);
            }
        } catch (SQLException ex) {
        }
        return "success";
    }

    public String autocomplete1() {
        try {
            
            Connection con = Connections.conn();

            String query = "select filename from files where filename like "+searchtext ;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                Autostr = Autostr + "," + rs.getString(1);
            }
        } catch (SQLException ex) {
        }

        return "success";
    }

    public String logout() {
        if (sessionMap != null) {
            sessionMap.invalidate();
        }
        return "success";
    }
}
