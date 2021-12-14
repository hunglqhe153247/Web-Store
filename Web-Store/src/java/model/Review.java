/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Hung
 */
public class Review {
    String id;
    String writer;
    String imagie;
    String category;
    String content;

    public Review(String id, String writer, String imagie, String category, String content) {
        this.id = id;
        this.writer = writer;
        this.imagie = imagie;
        this.category = category;
        this.content = content;
    }

    

    public Review() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getImagie() {
        return imagie;
    }

    public void setImagie(String imagie) {
        this.imagie = imagie;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
