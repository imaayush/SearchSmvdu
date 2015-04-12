/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;
import java.sql.Timestamp;

/**
 *
 * @author knight
 */
public class Files {
    String filename ,filetags, filedes,idfiles;
    Timestamp datetime;
    File file;

    public String getIdfiles() {
        return idfiles;
    }

    public void setIdfiles(String idfiles) {
        this.idfiles = idfiles;
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

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }  
}
