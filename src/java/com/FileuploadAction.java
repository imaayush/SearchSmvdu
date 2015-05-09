/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class FileuploadAction extends ActionSupport {

    private String fname;
    private String ftag;
    private String fdesc;
    private File file;
    private String fileFileName;
    private String fileContentType;
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFtag() {
        return ftag;
    }

    public void setFtag(String ftag) {
        this.ftag = ftag;
    }

    public String getFdesc() {
        return fdesc;
    }

    public void setFdesc(String fdesc) {
        this.fdesc = fdesc;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    @Override
    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            String user = (String) session.getAttribute("username");
            Connection con = Connections.conn();
            PreparedStatement stat = con.prepareStatement("insert into files(username, filename, filetags, filedescription, file, datetime) values(?,?,?,?,?,?)");
            stat.setString(1, user);
            stat.setString(2, fname);
            stat.setString(3, ftag);
            stat.setString(4, fdesc);
            FileInputStream fis = new FileInputStream(file);
            stat.setBinaryStream(5, fis, (int) file.length());
            Timestamp time = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(6, time);
            int rows = stat.executeUpdate();
            if (rows > 0) {
                return "success";
            } else {
                return "fail";
            }
            //return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String removefile() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            String user = (String) session.getAttribute("username");
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String fileid = request.getParameter("idfiles");
            setUsername(user);
            Connection con = Connections.conn();
            Statement st;
            String query = "delete from notifications where idfiles='" + fileid +"'";
            st = con.createStatement();
            st.executeUpdate(query);
            
            query = "delete from files where idfiles='" + fileid + "'";
            st = con.createStatement();
            st.executeUpdate(query);
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

}
