/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class LogNote {

    public static void log1(String active,String activeid)  {
        try{
        Connection con = Connections.conn();
        Statement ps = con.createStatement();
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        String time = "";
        String query = "insert into log(username, active,time,activeid) values('" + username + "','" + active + "','" + time + "','"+activeid+"')";

        Statement st = con.createStatement();
        st.executeUpdate(query);}
        catch(Exception e){
            System.out.println(e.toString());
        }

    }

}
