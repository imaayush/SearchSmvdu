/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.ByteArrayOutputStream;
import java.io.File;
import static java.lang.Math.ceil;
import java.security.MessageDigest;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class fileviewAction extends ActionSupport {

    public fileviewAction() {
    }
    String filename, filetags, filedes, idfiles, countLiked, viewed, email, countRecommended, countDownloaded, torrentname, tracker, totalsize;
    File file;
    Blob blob;
    int f = 0;
    ArrayList<TorrentInfo> torrentinfo = new ArrayList<TorrentInfo>();
    ArrayList<CommentInfo> commentinfo = new ArrayList<CommentInfo>();

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<CommentInfo> getCommentinfo() {
        return commentinfo;
    }

    public void setCommentinfo(ArrayList<CommentInfo> commentinfo) {
        this.commentinfo = commentinfo;
    }

    public String getViewed() {
        return viewed;
    }

    public void setViewed(String viewed) {
        this.viewed = viewed;
    }

    public String getTotalsize() {
        return totalsize;
    }

    public void setTotalsize(String totalsize) {
        this.totalsize = totalsize;
    }

    public ArrayList<TorrentInfo> getTorrentinfo() {
        return torrentinfo;
    }

    public void setTorrentinfo(ArrayList<TorrentInfo> torrentinfo) {
        this.torrentinfo = torrentinfo;
    }

    public String getTorrentname() {
        return torrentname;
    }

    public void setTorrentname(String torrentname) {
        this.torrentname = torrentname;
    }

    public String getTracker() {
        return tracker;
    }

    public void setTracker(String tracker) {
        this.tracker = tracker;
    }

    private byte b[];

    public byte[] getB() {
        return b;
    }

    public void setB(byte[] b) {
        this.b = b;
    }

    public Blob getBlob() {
        return blob;
    }

    public void setBlob(Blob blob) {
        this.blob = blob;
    }

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
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            String fileid = request.getParameter("fileid");
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            System.out.println(username);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select filename,filetags,filedescription,idfiles,viewed,email from files natural join user where idfiles ='" + fileid + "'");

            while (rs.next()) {
                setFilename(rs.getString(1));
                setFiletags(rs.getString(2));
                setFiledes(rs.getString(3));
                setIdfiles(rs.getString(4));
                setViewed(rs.getString(5));
                setEmail(rs.getString(6));
                int count = rs.getInt(5);
                ++count;
                if (username == null || !username.equals("admin")) {
                    PreparedStatement ps = con.prepareStatement("update files set viewed=" + count + " where idfiles=" + Integer.parseInt(fileid));
                    ps.executeUpdate();
                }
            }

            setCountLiked(CountLDRFile.countLike(Integer.parseInt(fileid)));
            setCountRecommended(CountLDRFile.countRecommend(Integer.parseInt(fileid)));
            setCountDownloaded(CountLDRFile.countDownload(Integer.parseInt(fileid)));

            if (username != null) {
                st = con.createStatement();
                rs = st.executeQuery("select username, comment, timedate, image from comments natural join user where idfiles ='" + fileid + "' order by timedate DESC");

                while (rs.next()) {
                    CommentInfo c = new CommentInfo();
                    c.setUsername(rs.getString(1));
                    c.setComment(rs.getString(2));
                    c.setTimedate(rs.getString(3).split("\\.")[0]);
                    c.setImage(rs.getString(4));
                    commentinfo.add(c);
                }
            }
            String query = "select file from files where idfiles=" + fileid;
            st = con.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                blob = rs.getBlob("file");
                f = 1;
            }

            b = new byte[(int) blob.length()];
            b = blob.getBytes(1, (int) blob.length());
            StringBuilder builder = new StringBuilder();
            int i = 0;
            while (!builder.toString().endsWith("pieces")) {
                i++;
                builder.append((char) b[i]); // It's ASCII anyway.

            }
            String info1 = builder.toString();
            String[] p = info1.split("8:announce36:|8:announce5:", 2);
            info1 = p[1];
            p = info1.split("announce|18:", 2);
            if (p[0].equals("http:")) {
                setTracker("none");
            } else {
                setTracker(p[0]);
            }
            info1 = p[1];
            p = info1.split("filesld6:");
            info1 = p[1];
            p = info1.split("eee4:name");
            String temp = p[0];
            info1 = p[1];
            p = info1.split("12:piece|:");
            String temp1;
            temp1 = p[1];

            setTorrentname(temp1.substring(0, (temp1.length() - 2)));
            info1 = temp;
            p = info1.split("d6:");
            double totalsize1 = 0;
            for (int j = 0; j < p.length; j++) {
                String size, temp2;
                TorrentInfo t = new TorrentInfo();
                temp2 = p[j];
                String[] x = temp2.split("pathl");
                temp2 = x[1];
                size = x[0];
                size = size.split("e4:|lengthi")[1];

                double size1 = Double.parseDouble(size) / 1024;
                totalsize1 = totalsize1 + size1;
                if (size1 > 1024) {
                    size = ceil(size1 / 1024) + " MB";
                } else {
                    size = ceil(size1) + " KB";
                }

                x = temp2.split(":", 2);
                temp2 = x[1];
                x = temp2.split(":", 2);
                temp2 = x[0];
                temp2 = temp2.substring(0, (temp2.length() - 3));
                t.setTname(temp2);
                t.setTsize(size);
                torrentinfo.add(t);
            }
            setTotalsize(ceil(totalsize1 / 1024) + " MB");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            i = 0;
            MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
            for (int data; (data = (int) b[i]) > -1; output.write(data)) {
                i++;
            }

            sha1.update(output.toByteArray(), 0, output.size() - 1);
            System.out.println(info1);
            con.close();
            return "success";
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return "fail";
        }
    }
}
