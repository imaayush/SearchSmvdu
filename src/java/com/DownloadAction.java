/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class DownloadAction extends ActionSupport {

    private byte b[];
    String fileid;
    String notification;
    Blob blob;
    int f = 0;

    public byte[] getB() {
        return b;
    }

    public void setB(byte[] b) {
        this.b = b;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public DownloadAction() {
    }

    public String execute() throws Exception {
        try {
            Connection con = Connections.conn();
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

            fileid = request.getParameter("idfiles");

            setNotification("Downloaded");
            Timestamp time = new Timestamp(System.currentTimeMillis());
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            String username = (String) session.getAttribute("username");
            if (username == null) {
                username = "Guest";
            }
            String query1 = "insert into notifications(notification, idfiles,username,notificationdatetime) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, notification);
            ps.setString(2, fileid);
            ps.setString(3, username);
            ps.setTimestamp(4, time);
            ps.executeUpdate();

            String query = "select file from files where idfiles=" + fileid;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                blob = rs.getBlob("file");
                f = 1;
            }

            b = new byte[(int) blob.length()];
            b = blob.getBytes(1, (int) blob.length());

            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("application/x-bittorrent");
            OutputStream out = response.getOutputStream();
            out.write(b);
            out.flush();
            out.close();

            if (f == 1) {
                this.setB(b);
                return "success";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

}
