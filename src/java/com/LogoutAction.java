/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DKG
 */
public class LogoutAction extends ActionSupport {

    public LogoutAction() {
    }

    public String execute() throws Exception {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession(false);
            if (session != null) {
                session.invalidate();
            }
            return "success";
        } catch (Exception e) {
            System.out.println(e.toString());
            return "fail";
        }
    }

}
