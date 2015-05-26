/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scheduler;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author knight
 */
public class Scheduler {

    /**
     * @param args the command line arguments
     */
    public static class ScheduledTask extends TimerTask {
        Date now; 
        public void run() {
            try {
                now = new Date(); // initialize date
                System.out.println("Time is :" + now); // Display current time
                Connection con = Connections.conn();
                Statement ps = con.createStatement();
                ResultSet rs = ps.executeQuery("select datetime,viewed,idfiles from files");        
                while (rs.next()) {
                   Timestamp oldtime= rs.getTimestamp("datetime");
                    long views= Long.parseLong(rs.getString("viewed"));
                    Timestamp time = new Timestamp(System.currentTimeMillis());
                    double diff=(double)((time.getTime()-oldtime.getTime())/(24 * 60 * 60 * 1000));
                    double index =(views/diff);
                    //System.out.println(diff);
                    String query = "update files set indexfile=" + index + "  where idfiles = " + rs.getInt("idfiles") + "";
                    Statement st = con.createStatement();
                    st.executeUpdate(query);
                }
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Scheduler.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public static void main(String[] args) {
        Timer time = new Timer(); // Instantiate Timer Object
        ScheduledTask st = new ScheduledTask(); // Instantiate SheduledTask class
        time.schedule(st, 0, 6 * 60 * 60 * 1000); // Create Repetitively task for every 6 hours

    }

}
