/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class EditAction extends ActionSupport {

    //private String email;
    //private String username;
    private String password;
    private String repassword;
    private String fname;
    private String lname;
    private String gender;
    private String dates;
    private String about;
    private String mobile;

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

    public String getFname() {
        return fname;
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
    public void validate() {
        if (!password.equals(repassword)) {
            addActionMessage("Password doesn't match !");
        }
    }

    @Override
    public String execute() throws Exception {

        if (!password.equals(repassword)) {
            return "fail";
        } else {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            String query = "update user set password='" + password + "', name='" + fname + " " + lname + "', gender='" + gender + "', birthday='" + dates + "', about='" + about + "', mobile='" + mobile + "'  where username = '" + username + "'";
            Statement st = con.createStatement();
            st.executeUpdate(query);
        }
        return "success";
    }
}
