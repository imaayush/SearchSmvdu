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
public class AddAnswerAction extends ActionSupport {
    private String youranswer;
    private String idforumquestion;

    public String getYouranswer() {
        return youranswer;
    }

    public void setYouranswer(String youranswer) {
        this.youranswer = youranswer;
    }

    public String getIdforumquestion() {
        return idforumquestion;
    }

    public void setIdforumquestion(String idforumquestion) {
        this.idforumquestion = idforumquestion;
    }

    public AddAnswerAction() {
    }
    
    public String execute() throws Exception {
        try{
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        
        Connection con = Connections.conn();
        PreparedStatement stat = con.prepareStatement("insert into questiondetails(idforumquestion, username, answer) values(?,?,?)");
        stat.setString(1, idforumquestion);
        stat.setString(2, username);
        stat.setString(3, youranswer);
        stat.executeUpdate();
        
        stat = con.prepareStatement("update forumquestion set answered=answered+1 where idforumquestion='" +idforumquestion +"'");
        stat.executeUpdate();        
        return SUCCESS;
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
    
}
