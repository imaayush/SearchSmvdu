/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author DKG
 */
public class Forum {
    String question, timeAnswer, usernameAnswer, idforumquestion, image, answer, viewed, answered;   

    public String getViewed() {
        return viewed;
    }

    public void setViewed(String viewed) {
        this.viewed = viewed;
    }

    public String getAnswered() {
        return answered;
    }

    public void setAnswered(String answered) {
        this.answered = answered;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getTimeAnswer() {
        return timeAnswer;
    }

    public void setTimeAnswer(String timeAnswer) {
        this.timeAnswer = timeAnswer;
    }    

    public String getUsernameAnswer() {
        return usernameAnswer;
    }

    public void setUsernameAnswer(String usernameAnswer) {
        this.usernameAnswer = usernameAnswer;
    }

    public String getIdforumquestion() {
        return idforumquestion;
    }

    public void setIdforumquestion(String idforumquestion) {
        this.idforumquestion = idforumquestion;
    }    
}
