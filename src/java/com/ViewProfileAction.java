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
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class ViewProfileAction extends ActionSupport {

    public ViewProfileAction() {
    }

    private String email;
    private String gender;
    private String name;
    private String image;
    private String UserName;
    private String circle;
    private String likes;
    private String date;
    private String status;
    private String adminstatus;

    public String getAdminstatus() {
        return adminstatus;
    }

    public void setAdminstatus(String adminstatus) {
        this.adminstatus = adminstatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    ArrayList<Loginfo> loginfo = new ArrayList<Loginfo>();

    public ArrayList<Loginfo> getLoginfo() {
        return loginfo;
    }

    public void setLoginfo(ArrayList<Loginfo> loginfo) {
        this.loginfo = loginfo;
    }

    public String getCircle() {
        return circle;
    }

    public void setCircle(String circle) {
        this.circle = circle;
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String User = request.getParameter("UserName");
            setUserName(User);
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("select Name ,Email ,Gender, image, dateuser,status, adminstatus from user where UserName='" + User + "'");

            String x = LikeCircle.likecount(User);
            setLikes(x);
            x = LikeCircle.circlecount(User);
            setCircle(x);
            while (rs.next()) {
                setName(rs.getString(1));
                setEmail(rs.getString(2));
                setGender(rs.getString(3));
                setImage(rs.getString(4));
                setDate(rs.getString(5));
                setStatus(rs.getString(6));
                setAdminstatus(rs.getString(7));
            }
            con.close();
            con = Connections.conn();
            ps = con.createStatement();
            rs = ps.executeQuery("select active,activeid,time from log where username='" + User + "'");
            while (rs.next()) {

                Loginfo p = new Loginfo();

                p.setActive(rs.getString(1));
                p.setActiveid(rs.getString(2));
                String s[] = rs.getString(3).split("\\.")[0].split("\\:");
                p.setTime(s[0] + ":" + s[1]);

                loginfo.add(p);
            }
            return "success";
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return "fail";
        }
    }
}
