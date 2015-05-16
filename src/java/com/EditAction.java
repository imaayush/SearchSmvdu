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
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class EditAction extends ActionSupport {

    private String fname;
    private String lname;
    private String gender;
    private String dates;
    private String about;
    private String mobile;
    private String password;
    private String repassword;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFname() {
        return fname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public EditAction() {
    }

    @Override
    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            name = fname + " " + lname;
            setName(name);
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            String sql = "select name, birthday, about, mobile from user where username='" + username + "'";
            Statement st1 = con.createStatement();
            ResultSet rs = st1.executeQuery(sql);
            while (rs.next()) {
                if (fname.equals("") && lname.equals("")) {
                    setName(rs.getString(1));
                }
                if (dates.equals("")) {
                    setDates(rs.getString(2));
                }
                if (about.equals("")) {
                    setAbout(rs.getString(3));
                }
                if (mobile.equals("")) {
                    setMobile(rs.getString(4));
                }
                String query = "update user set name='" + name + "', gender='" + gender + "', birthday='" + dates + "', about='" + about + "', mobile='" + mobile + "'  where username = '" + username + "'";
                Statement st = con.createStatement();
                st.executeUpdate(query);

            }
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String changepassword() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            String query = "update user set password='" + password + "'  where username = '" + username + "'";
            Statement st = con.createStatement();
            st.executeUpdate(query);
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
}
