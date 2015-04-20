/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;

/**
 *
 * @author knight
 */
public class Files {
    String filename ,filetags, filedes,idfiles, time, countLiked, countDownloaded, viewed;    
    File file;

    public String getCountDownloaded() {
        return countDownloaded;
    }

    public String getViewed() {
        return viewed;
    }

    public void setViewed(String viewed) {
        this.viewed = viewed;
    }

    public void setCountDownloaded(String countDownloaded) {
        this.countDownloaded = countDownloaded;
    }

    public String getCountLiked() {
        return countLiked;
    }

    public void setCountLiked(String countLiked) {
        this.countLiked = countLiked;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

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
}
