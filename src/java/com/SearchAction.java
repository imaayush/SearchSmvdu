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
 * @author knight
 */
public class SearchAction extends ActionSupport {
    private String searchtext ,Autostr ;
    public  ArrayList<Files> file2 = new ArrayList<Files>();

    public ArrayList<Files> getFile2() {
        return file2;
    }

    public String getAutostr() {
        return Autostr;
    }

    public void setAutostr(String Autostr) {
        this.Autostr = Autostr;
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
    
    public SearchAction() {
    }
    
    public String execute() throws Exception {
        try{
       Connection con = Connections.conn();
       Statement ps0 = con.createStatement();
        ResultSet rs0 = ps0.executeQuery("select filename,filetags,filedescription ,idfiles,datetime,viewed,indexfile from files where filename like '%"+searchtext+"' and filetags like '%"+ searchtext+"' and filedescription like '%"+ searchtext+"%' ORDER BY indexfile DESC" );

        while (rs0.next()) {
            Files f = new Files();
            f.setFilename(rs0.getString(1));
            f.setFiletags(rs0.getString(2));
            f.setFiledes(rs0.getString(3));
            f.setIdfiles(rs0.getString(4));
            String s = rs0.getString(5);
            String s1[] = s.split("\\.");            
            f.setTime(s1[0]);
            f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs0.getString(4))));
            f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs0.getString(4))));
            f.setViewed(rs0.getString(6));
            file2.add(f);
        }
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles,datetime,viewed,indexfile from files where filename like '%"+searchtext+"'  ORDER BY indexfile DESC" );

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
        Statement ps1 = con.createStatement();
        ResultSet rs1 = ps1.executeQuery("select filename,filetags,filedescription ,idfiles,datetime,viewed,indexfile from files where filename like '%"+searchtext+"' and filetags like '%"+ searchtext+"%' ORDER BY indexfile DESC" );

        while (rs1.next()) {
            Files f = new Files();
            f.setFilename(rs1.getString(1));
            f.setFiletags(rs1.getString(2));
            f.setFiledes(rs1.getString(3));
            f.setIdfiles(rs1.getString(4));
            String s = rs1.getString(5);
            String s1[] = s.split("\\.");            
            f.setTime(s1[0]);
            f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs1.getString(4))));
            f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs1.getString(4))));
            f.setViewed(rs1.getString(6));
            file2.add(f);
        }
        Statement ps2 = con.createStatement();
        ResultSet rs2 = ps2.executeQuery("select filename,filetags,filedescription ,idfiles,datetime,viewed ,indexfile from files where filename like '%"+searchtext+"' or filetags like '%"+ searchtext+"' or filedescription like '%"+ searchtext+"%' ORDER BY indexfile DESC" );

        while (rs2.next()) {
            Files f = new Files();
            f.setFilename(rs2.getString(1));
            f.setFiletags(rs2.getString(2));
            f.setFiledes(rs2.getString(3));
            f.setIdfiles(rs2.getString(4));
            String s = rs2.getString(5);
            String s1[] = s.split("\\.");            
            f.setTime(s1[0]);
            f.setCountLiked(CountLDRFile.countLike(Integer.parseInt(rs2.getString(4))));
            f.setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(rs2.getString(4))));
            f.setViewed(rs2.getString(6));
            file2.add(f);
        }
        con.close();
        return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }   
}
