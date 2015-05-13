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
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class CommentAction extends ActionSupport {

    private String cmt;
    private String idfiles;

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public String getIdfiles() {
        return idfiles;
    }

    public void setIdfiles(String idfiles) {
        this.idfiles = idfiles;
    }

    public CommentAction() {
    }

    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");

            Connection con = Connections.conn();
            PreparedStatement stat = con.prepareStatement("insert into comments(idfiles, username, comment) values(?,?,?)");
            stat.setString(1, idfiles);
            stat.setString(2, username);
            stat.setString(3, cmt);
            stat.executeUpdate();
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

}
