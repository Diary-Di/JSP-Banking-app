package com.example.crud;

public class Client {
    private String numtel_client;
    private String nom_client;
    private String sexe_client;
    private int age_client;
    private int solde_client;
    private String mail_client;

    // Constructor without parameters
    public Client() {}

    // Constructor with all parameters
    public Client(String numtel_client, String nom_client, String sexe_client, int age_client,  int solde_client, String mail_client) {
        this.numtel_client = numtel_client;
        this.nom_client = nom_client;
        this.sexe_client = sexe_client;
        this.age_client = age_client;
        this.solde_client = solde_client;
        this.mail_client = mail_client;
    }

    // Getters and Setters

    public String getNumtel_client() {
        return numtel_client;
    }

    public void setNumtel_client(String numtel_client) {
        this.numtel_client = numtel_client;
    }

    public String getNom_client() {
        return nom_client;
    }

    public void setNom_client(String nom_client) {
        this.nom_client = nom_client;
    }

    public String getSexe_client() {
        return sexe_client;
    }

    public void setSexe_client(String sexe_client) {
        this.sexe_client = sexe_client;
    }

    public int getAge_client() {
        return age_client;
    }

    public void setAge_client(int age_client) {
        this.age_client = age_client;
    }

    public int getSolde_client() {
        return solde_client;
    }

    public void setSolde_client(int solde_client) {
        this.solde_client = solde_client;
    }

    public String getMail_client() {
        return mail_client;
    }

    public void setMail_client(String mail_client) {
        this.mail_client = mail_client;
    }
}


