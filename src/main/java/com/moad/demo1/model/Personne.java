package com.moad.demo1.model;

public class Personne {
    private int idPersonne;
    private String nom;
    private String prenom;
    private String motDePasse;

    // Constructors
    public Personne() {
    }

    public Personne(int idPersonne, String nom, String prenom, String motDePasse) {
        this.idPersonne = idPersonne;
        this.nom = nom;
        this.prenom = prenom;
        this.motDePasse = motDePasse;
    }

    public Personne(String nom, String prenom, String motDePasse) {
        this.nom = nom;
        this.prenom = prenom;
        this.motDePasse = motDePasse;
    }

    // Getters and Setters
    public int getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(int idPersonne) {
        this.idPersonne = idPersonne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    @Override
    public String toString() {
        return "Personne{" +
                "idPersonne=" + idPersonne +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", motDePasse='" + motDePasse + '\'' +
                '}';
    }
}