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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class fileviewAction extends ActionSupport {

    public fileviewAction() {
    }
    String filename, filetags, filedes, idfiles, countLiked, countRecommended, countDownloaded;
    File file;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFiletags() {
        return filetags;
    }

    public void setFiletags(String filetags) {
        this.filetags = filetags;
    }

    public String getFiledes() {
        return filedes;
    }

    public void setFiledes(String filedes) {
        this.filedes = filedes;
    }

    public String getIdfiles() {
        return idfiles;
    }

    public void setIdfiles(String idfiles) {
        this.idfiles = idfiles;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getCountLiked() {
        return countLiked;
    }

    public void setCountLiked(String countLiked) {
        this.countLiked = countLiked;
    }

    public String getCountRecommended() {
        return countRecommended;
    }

    public void setCountRecommended(String countRecommended) {
        this.countRecommended = countRecommended;
    }

    public String getCountDownloaded() {
        return countDownloaded;
    }

    public void setCountDownloaded(String countDownloaded) {
        this.countDownloaded = countDownloaded;
    }

    public String execute() throws Exception {
        Connection con = Connections.conn();
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String fileid = request.getParameter("fileid");
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select filename,filetags,filedescription,idfiles from files where idfiles ='" + fileid + "'");

        while (rs.next()) {

            setFilename(rs.getString(1));
            setFiletags(rs.getString(2));
            setFiledes(rs.getString(3));
            setIdfiles(rs.getString(4));

        }
        
        setCountLiked(CountLDRFile.countLike(Integer.parseInt(fileid)));
        setCountRecommended(CountLDRFile.countRecommend(Integer.parseInt(fileid)));
        setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(fileid)));
        
        con.close();
        return "success";
    }

}
