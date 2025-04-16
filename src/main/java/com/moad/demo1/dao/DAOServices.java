package com.moad.demo1.dao;


import com.moad.demo1.model.Message;
import com.moad.demo1.model.Personne;
import com.moad.demo1.util.HashUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAOServices {

    // Récupérer tous les messages publics (idPersonne = 1)
    public static List<Message> getPublicMessages() {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM Message WHERE idPersonne = 1";

        try (Connection conn = DAOUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Message message = new Message(
                        rs.getInt("idMessage"),
                        rs.getInt("idPersonne"),
                        rs.getString("sujet"),
                        rs.getString("contenu")
                );
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return messages;
    }

    // Récupérer uniquement les sujets des messages publics
    public static List<String> getPublicSubjects() {
        List<String> subjects = new ArrayList<>();
        String sql = "SELECT sujet FROM Message WHERE idPersonne = 1";

        try (Connection conn = DAOUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                subjects.add(rs.getString("sujet"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subjects;
    }

    // Inscrire un nouvel utilisateur
    public static boolean registerUser(String nom, String prenom, String motDePasse) {
        String sql = "INSERT INTO Personne (nom, prenom, motDePasse) VALUES (?, ?, ?)";
        String motDePasseHache = HashUtil.hashPassword(motDePasse);

        try (Connection conn = DAOUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, motDePasseHache);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Récupérer les messages d'un utilisateur spécifique
    public static List<Message> getUserMessages(int idPersonne) {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM Message WHERE idPersonne = ?";

        try (Connection conn = DAOUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idPersonne);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message(
                        rs.getInt("idMessage"),
                        rs.getInt("idPersonne"),
                        rs.getString("sujet"),
                        rs.getString("contenu")
                );
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return messages;
    }

    // Récupérer tous les utilisateurs
    public static List<Personne> getAllPersonnes() {
        List<Personne> personnes = new ArrayList<>();
        String sql = "SELECT * FROM Personne";

        try (Connection conn = DAOUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Personne personne = new Personne(
                        rs.getInt("idPersonne"),
                        rs.getString("nom"),
                        rs.getString("prenom"),
                        rs.getString("motDePasse")
                );
                personnes.add(personne);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return personnes;
    }

    // Authentifier un utilisateur
    public static Personne authenticateUser(String nom, String prenom, String motDePasse) {
        String sql = "SELECT * FROM Personne WHERE nom = ? AND prenom = ? AND motDePasse = ?";
        String hashedPassword = HashUtil.hashPassword(motDePasse);

        try (Connection conn = DAOUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Personne(
                        rs.getInt("idPersonne"),
                        rs.getString("nom"),
                        rs.getString("prenom"),
                        rs.getString("motDePasse")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}