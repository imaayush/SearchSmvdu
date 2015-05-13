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
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class EnableDisableAction extends ActionSupport {

    public String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public EnableDisableAction() {
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String user = request.getParameter("UserName");
            setUsername(user);
            String query;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select adminstatus from user where username='" + user + "'");
            while (rs.next()) {
                st = con.createStatement();
                if (rs.getString(1).equals("Enable")) {
                    query = "update user set adminstatus='Disable' where username='" + user + "'";
                } else {
                    query = "update user set adminstatus='Enable' where username='" + user + "'";
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
