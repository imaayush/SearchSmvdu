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

/**
 *
 * @author DKG
 */
public class ForgetpasswordAction extends ActionSupport {

    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    Connection con = Connections.conn();

    public ForgetpasswordAction() {
    }

    @Override
    public void validate() {
        String query = "select * from user where email='" + email + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                addActionMessage("New Password has been sent to your email...!!!");
            } else {
                addActionMessage("incorrect Email Address...!!!");
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }

    public String execute() throws Exception {
        String query = "select * from user where email='" + email + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                String autoPassword = password.pass();
                String stat = SendEmail.sendEmail(email, "Requested New Password", "Your  new password is : " + autoPassword);
                if (stat.equals("success")) {
                    query = "update user set password='" + autoPassword + "' where email='" + email + "'";
                    st = con.createStatement();
                    st.executeUpdate(query);
                    return "success";
                } else {
                    return "error";
                }
            } else {
                return "fail";
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            return "error";
        }
    }
}
