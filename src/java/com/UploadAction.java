/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author knight
 */
public class UploadAction extends ActionSupport implements SessionAware {

    private File file;
    private String fileFileName;
    private String fileContentType;
    private SessionMap<String, Object> sessionMap;
    
    String filePath;    
    
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
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap) map;
    }  

    @Override
    public String execute() throws Exception {
        //throw new UnsupportedOperationException("Not supported yet.");
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        String username = (String) session.getAttribute("username");
        filePath = "C:\\Users\\knight\\Documents\\NetBeansProjects\\SearchSmvdu\\web\\img\\";        
        File destfile = new File(filePath, username + ".jpg");
        FileUtils.copyFile(getFile(), destfile);
        String path = "img/" + username + ".jpg";
        String query = "update user set image='" + path + "' where username='" + username + "'";
        Connection con = Connections.conn();
        Statement st = con.createStatement();
        st.executeUpdate(query);
        return SUCCESS;
    }
}
