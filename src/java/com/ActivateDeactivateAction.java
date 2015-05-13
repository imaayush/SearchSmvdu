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
public class ActivateDeactivateAction extends ActionSupport {

    public ActivateDeactivateAction() {
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            String query;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select status from user where username='" + username + "'");
            while (rs.next()) {
                st = con.createStatement();
                if (rs.getString(1).equals("Active")) {
                    query = "update user set status='Not Active' where username='" + username + "'";
                } else {
                    query = "update user set status='Active' where username='" + username + "'";
                }
                st.executeUpdate(query);
            }
            return SUCCESS;
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
}
