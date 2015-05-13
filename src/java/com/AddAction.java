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
 * @author knight
 */
public class AddAction extends ActionSupport {

    Connection con = Connections.conn();
    private String name;
    ArrayList<People> people = new ArrayList<People>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<People> getPeople() {
        return people;
    }

    public void setPeople(ArrayList<People> people) {
        this.people = people;
    }

    public AddAction() {
    }

    public String execute() throws Exception {
        try{
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        Statement ps = con.createStatement();
        ResultSet rs = null;
        if (username.equals("admin")) {
            rs = ps.executeQuery("select name,UserName,image,id from user where username!='" + username + "' AND username!='admin'");
        } else {
            rs = ps.executeQuery("select name,UserName,image,id from user where username!='" + username + "' AND username!='admin' AND status='Active'");
        }
        while (rs.next()) {

            People p = new People();

            p.setName(rs.getString(1));
            p.setUserName(rs.getString(2));
            p.setPhoto(rs.getString(3));
            p.setId(rs.getString(4));
            people.add(p);
        }
        con.close();
        return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
    public String searchuser() throws Exception {
        try{
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        Statement ps = con.createStatement();
        ResultSet rs = null;
        if (username.equals("admin")) {
            rs = ps.executeQuery("select name,UserName,image,id from user where name='" + name + "'");
        } else {
            rs = ps.executeQuery("select name,UserName,image,id from user where name='" + name + "'AND status='Active'");
        }
        while (rs.next()) {

            People p = new People();

            p.setName(rs.getString(1));
            p.setUserName(rs.getString(2));
            p.setPhoto(rs.getString(3));
            p.setId(rs.getString(4));
            people.add(p);
        }
        con.close();
        return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
}
