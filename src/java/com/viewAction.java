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
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author knight
 */
public class viewAction extends ActionSupport {

    public viewAction() {
    }
    private String username;
    private SessionMap<String, Object> sessionMap;
    private String email;
    private String gender;
    private String name;
    private String image;
    private String circle;
    private String likes;
    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    ArrayList<Files> file1 = new ArrayList<Files>();
    ArrayList<Loginfo> loginfo = new ArrayList<Loginfo>();
    ArrayList<People> people = new ArrayList<People>();

    public ArrayList<People> getPeople() {
        return people;
    }

    public void setPeople(ArrayList<People> people) {
        this.people = people;
    }

    public ArrayList<Loginfo> getLoginfo() {
        return loginfo;
    }

    public void setLoginfo(ArrayList<Loginfo> loginfo) {
        this.loginfo = loginfo;
    }

    public ArrayList<Files> getFile1() {
        return file1;
    }

    public void setFile1(ArrayList<Files> file1) {
        this.file1 = file1;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
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
        Connection con = Connections.conn();
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String User = (String) session.getAttribute("username");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select Name ,Email ,Gender, image, dateuser from user where UserName='" + User + "'");
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
        }
        ps = con.createStatement();
        rs = ps.executeQuery("select filename,filetags,filedescription,idfiles from files where username='" + User + "'");

        while (rs.next()) {
            Files f = new Files();
            f.setFilename(rs.getString(1));
            f.setFiletags(rs.getString(2));
            f.setFiledes(rs.getString(3));
            f.setIdfiles(rs.getString(4));
            file1.add(f);
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
            p.setTime(s[0] + ":" +s[1]);

            loginfo.add(p);
        }
       con.close();
       con = Connections.conn();
        ps = con.createStatement();
        rs = ps.executeQuery("select DISTINCT name ,user.UserName,image,id  from circle inner join user on circle.username=user.UserName where circle.circlename='"+User+"'");
        while (rs.next()) {
            
            People p = new People();
            
            p.setName(rs.getString(1));
            p.setUserName(rs.getString(2));
            p.setPhoto(rs.getString(3));
             p.setId(rs.getString(4));
            people.add(p);
        }
        return "success";
    }

}
