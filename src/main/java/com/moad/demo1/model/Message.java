package com.moad.demo1.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idMessage;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idPersonne", nullable = false)
    private Personne personne;
    
    @Column(name = "sujet", nullable = false)
    private String sujet;
    
    @Column(name = "contenu", nullable = false, length = 1000)
    private String contenu;

    // Constructors
    public Message() {
    }

    public Message(int idMessage, Personne personne, String sujet, String contenu) {
        this.idMessage = idMessage;
        this.personne = personne;
        this.sujet = sujet;
        this.contenu = contenu;
    }

    public Message(Personne personne, String sujet, String contenu) {
        this.personne = personne;
        this.sujet = sujet;
        this.contenu = contenu;
    }
    
    // For backward compatibility with existing code
    public Message(int idMessage, int idPersonne, String sujet, String contenu) {
        this.idMessage = idMessage;
        this.sujet = sujet;
        this.contenu = contenu;
        // Note: personne will need to be set separately
    }

    // Getters and Setters
    public int getIdMessage() {
        return idMessage;
    }

    public void setIdMessage(int idMessage) {
        this.idMessage = idMessage;
    }

    public Personne getPersonne() {
        return personne;
    }

    public void setPersonne(Personne personne) {
        this.personne = personne;
    }
    
    // For backward compatibility with existing code
    public int getIdPersonne() {
        return personne != null ? personne.getIdPersonne() : 0;
    }

    public void setIdPersonne(int idPersonne) {
        // This method is kept for backwards compatibility
        // In Hibernate usage, set the personne object directly
    }

    public String getSujet() {
        return sujet;
    }

    public void setSujet(String sujet) {
        this.sujet = sujet;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    @Override
    public String toString() {
        return "Message{" +
                "idMessage=" + idMessage +
                ", idPersonne=" + (personne != null ? personne.getIdPersonne() : "null") +
                ", sujet='" + sujet + '\'' +
                ", contenu='" + contenu + '\'' +
                '}';
    }
}