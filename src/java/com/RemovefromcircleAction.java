/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class RemovefromcircleAction extends ActionSupport {

    public String username2;

    public String getUsername2() {
        return username2;
    }

    public void setUsername2(String username2) {
        this.username2 = username2;
    }

    public RemovefromcircleAction() {
    }

    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username1 = (String) session.getAttribute("username");
            Connection con = Connections.conn();

            LogNote.log1("Remove from Circle", username2);
            PreparedStatement stat = con.prepareStatement("delete from circle where circlename='" + username1 + "' AND username='" + username2 + "'");
            stat.executeUpdate();

            return "success";

            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String unlike() {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username1 = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            String query = "delete from likeuser where likes='" + username1 + "' AND username='" + username2 + "'";
            LogNote.log1("Unliked", username2);
            Statement st = con.createStatement();
            st.executeUpdate(query);

            return "success";

            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }

    }

}
