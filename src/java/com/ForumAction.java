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
import java.util.ArrayList;

/**
 *
 * @author DKG
 */
public class ForumAction extends ActionSupport {
    
    ArrayList<Forum> forum = new ArrayList<Forum>();

    public ArrayList<Forum> getForum() {
        return forum;
    }

    public void setForum(ArrayList<Forum> forum) {
        this.forum = forum;
    }
    
    public ForumAction() {
    }
    
    public String execute() throws Exception {
        Connection con = Connections.conn();
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select idforumquestion,question,username,time,viewed,answered from forumquestion");
        while (rs.next()) {
            Forum f = new Forum();
            f.setIdforumquestion(rs.getString(1));
            f.setQuestion(rs.getString(2));
            f.setUsernameAnswer(rs.getString(3));
            f.setTimeAnswer(rs.getString(4).split("\\.")[0]);
            f.setViewed(rs.getString(5));
            f.setAnswered(rs.getString(6));
            forum.add(f);
        }
        return "success";
    }    
}
