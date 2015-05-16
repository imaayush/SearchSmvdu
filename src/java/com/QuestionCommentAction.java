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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class QuestionCommentAction extends ActionSupport {

    private String idforumquestion;
    private String question;
    private String username;
    private String time;
    private String img;

    ArrayList<Forum> forum = new ArrayList<Forum>();

    public ArrayList<Forum> getForum() {
        return forum;
    }

    public void setForum(ArrayList<Forum> forum) {
        this.forum = forum;
    }

    public String getImg() {
        return img;
    }

    public void setImage(String img) {
        this.img = img;
    }

    public String getIdforumquestion() {
        return idforumquestion;
    }

    public void setIdforumquestion(String idforumquestion) {
        this.idforumquestion = idforumquestion;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public QuestionCommentAction() {
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String idquestion = request.getParameter("idforumquestion");
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("select idforumquestion,question,username,time from forumquestion where idforumquestion='" + idquestion + "'");
            while (rs.next()) {
                setIdforumquestion(rs.getString(1));
                setQuestion(rs.getString(2));
                setUsername(rs.getString(3));
                setTime(rs.getString(4).split("\\.")[0]);
                ps = con.createStatement();
                rs = ps.executeQuery("select image from user where username='" + rs.getString(3) + "'");
                while (rs.next()) {
                    setImage(rs.getString(1));
                }
            }
            ps = con.createStatement();
            rs = ps.executeQuery("select username,time,answer,image from questiondetails natural join user where idforumquestion='" + idquestion + "'");
            while (rs.next()) {
                Forum f = new Forum();
                f.setUsernameAnswer(rs.getString(1));
                f.setTimeAnswer(rs.getString(2).split("\\.")[0]);
                f.setAnswer(rs.getString(3));
                f.setImage(rs.getString(4));
                forum.add(f);
            }

            PreparedStatement stat = con.prepareStatement("update forumquestion set viewed=viewed+1 where idforumquestion='" + idquestion + "'");
            stat.executeUpdate();

            return SUCCESS;
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

}
