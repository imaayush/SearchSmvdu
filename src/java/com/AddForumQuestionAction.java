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
public class AddForumQuestionAction extends ActionSupport {
    
    private String question;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
    
    public AddForumQuestionAction() {
    }
    
    public String execute() throws Exception {
        Connection conn = Connections.conn();
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        String query = "insert into forumquestion(question, username) values(?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, question);
        ps.setString(2, username);
        ps.executeUpdate();
        return "success";
    }
    
}
