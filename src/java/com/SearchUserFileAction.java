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
public class SearchUserFileAction extends ActionSupport {

    private String searchoption;
    private String searchtext;
    ArrayList<People> people = new ArrayList<People>();
    ArrayList<Files> file2 = new ArrayList<Files>();

    public ArrayList<Files> getFile2() {
        return file2;
    }

    public void setFile2(ArrayList<Files> file2) {
        this.file2 = file2;
    }

    public ArrayList<People> getPeople() {
        return people;
    }

    public void setPeople(ArrayList<People> people) {
        this.people = people;
    }

    public String getSearchoption() {
        return searchoption;
    }

    public void setSearchoption(String searchoption) {
        this.searchoption = searchoption;
    }

    public String getSearchtext() {
        return searchtext;
    }

    public void setSearchtext(String searchtext) {
        this.searchtext = searchtext;
    }
    
    Connection con = Connections.conn();

    public SearchUserFileAction() {
    }

    public String execute() throws Exception {
        try {
            if (searchoption.equals("User")) {
                Statement ps = con.createStatement();
                ResultSet rs = null;
                rs = ps.executeQuery("select name,UserName,image,id from user where email='" + searchtext + "'");

                while (rs.next()) {
                    People p = new People();

                    p.setName(rs.getString(1));
                    p.setUserName(rs.getString(2));
                    p.setPhoto(rs.getString(3));
                    p.setId(rs.getString(4));
                    people.add(p);
                }
                con.close();
                return "successuser";
            } else if (searchoption.equals("File")) {
                Statement ps = con.createStatement();
                ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files where idfiles='" + searchtext + "'");

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
                    setSearchtext("Search");
                }
                con.close();
                return "successfile";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }
}
