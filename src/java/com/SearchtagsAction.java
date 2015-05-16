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
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class SearchtagsAction extends ActionSupport {

    String searchtext;

    ArrayList<Files> file2 = new ArrayList<Files>();

    public ArrayList<Files> getFile2() {
        return file2;
    }

    public void setFile2(ArrayList<Files> file2) {
        this.file2 = file2;
    }

    public String getSearchtext() {
        return searchtext;
    }

    public void setSearchtext(String searchtext) {
        this.searchtext = searchtext;
    }

    public SearchtagsAction() {
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String tagname = request.getParameter("tagname");
            System.out.println(tagname);
            setSearchtext(tagname + "s");
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files where filetags='" + tagname + "' ORDER BY datetime DESC");

            while (rs.next()) {
                Files f = new Files();
                f.setFilename(rs.getString(1));
                f.setFiletags(rs.getString(2));
                f.setFiledes(rs.getString(3));
                f.setIdfiles(rs.getString(4));
                String s = rs.getString(5);
                String s1[] = s.split("\\.");
                f.setTime(s1[0]);
                f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs.getString(4))));
                f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs.getString(4))));
                f.setViewed(rs.getString(6));
                file2.add(f);
            }
            con.close();
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String popular() throws Exception {
        try {
            Connection con = Connections.conn();
            setSearchtext("Popular on SMVDU");
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files ORDER BY viewed DESC");

            while (rs.next()) {
                Files f = new Files();
                f.setFilename(rs.getString(1));
                f.setFiletags(rs.getString(2));
                f.setFiledes(rs.getString(3));
                f.setIdfiles(rs.getString(4));
                String s = rs.getString(5);
                String s1[] = s.split("\\.");
                f.setTime(s1[0]);
                f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs.getString(4))));
                f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs.getString(4))));
                f.setViewed(rs.getString(6));
                file2.add(f);
            }
            con.close();
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

    public String recent() throws Exception {
        try {
            Connection con = Connections.conn();
            setSearchtext("Recently Added");
            Statement ps = con.createStatement();
            int count = 10;
            ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files ORDER BY datetime DESC");

            while (rs.next()) {
                Files f = new Files();
                f.setFilename(rs.getString(1));
                f.setFiletags(rs.getString(2));
                f.setFiledes(rs.getString(3));
                f.setIdfiles(rs.getString(4));
                String s = rs.getString(5);
                String s1[] = s.split("\\.");
                f.setTime(s1[0]);
                f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs.getString(4))));
                f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs.getString(4))));
                f.setViewed(rs.getString(6));
                file2.add(f);
                count--;
                if (count == 0) {
                    break;
                }
            }
            con.close();
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
}
