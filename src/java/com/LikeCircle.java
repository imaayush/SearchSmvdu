/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author knight
 */
public class LikeCircle {
   
    
    public  static String likecount( String likes) throws SQLException{
        Connection con = Connections.conn();
        Statement ps = con.createStatement();
        int count1 =0;
        ResultSet rs = ps.executeQuery("select count(idlike) as count1  from likeuser where  username='"+likes+"'");

        while (rs.next()) {
            count1 = rs.getInt("count1");
        }
        return Integer.toString(count1);
    }
    public static String circlecount(String circles) throws SQLException{
         Connection con = Connections.conn();
        Statement ps = con.createStatement();
        int count1 =0;
        ResultSet rs = ps.executeQuery("select count(idcircle) as count1  from circle where  circlename='"+circles+"'");

        while (rs.next()) {
            count1 = rs.getInt("count1");
        }
        return Integer.toString(count1);
        
    }
}
