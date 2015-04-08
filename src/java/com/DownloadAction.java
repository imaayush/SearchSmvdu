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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author knight
 */
public class DownloadAction extends ActionSupport {
private byte b[];
 Blob blob;
int f=0;
    public byte[] getB() {
        return b;
    }

    public void setB(byte[] b) {
        this.b = b;
    }


    public DownloadAction() {
    }

    public String execute() throws Exception {
        Connection con = Connections.conn();
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

        String fileid = request.getParameter("idfiles");
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
    }

}
