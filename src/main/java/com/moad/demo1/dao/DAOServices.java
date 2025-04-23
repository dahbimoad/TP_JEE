package com.moad.demo1.dao;

import com.moad.demo1.model.Message;
import com.moad.demo1.model.Personne;
import com.moad.demo1.util.HashUtil;
import com.moad.demo1.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class DAOServices {

    public static List<Message> getPublicMessages() {
        List<Message> messages = new ArrayList<>();
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // Select messages from id 1 (public messages)
            Query<Message> query = session.createQuery("FROM Message m WHERE m.personne.idPersonne = :id", Message.class);
            query.setParameter("id", 1);
            messages = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return messages;
    }

    public static List<String> getPublicSubjects() {
        List<String> subjects = new ArrayList<>();
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<String> query = session.createQuery("SELECT m.sujet FROM Message m WHERE m.personne.idPersonne = :id", String.class);
            query.setParameter("id", 1);
            subjects = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return subjects;
    }

    public static boolean registerUser(String nom, String prenom, String motDePasse) {
        String motDePasseHache = HashUtil.hashPassword(motDePasse);
        Transaction transaction = null;
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            
            Personne personne = new Personne(nom, prenom, motDePasseHache);
            session.persist(personne);
            
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public static List<Message> getUserMessages(int idPersonne) {
        List<Message> messages = new ArrayList<>();
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Message> query = session.createQuery("FROM Message m WHERE m.personne.idPersonne = :id", Message.class);
            query.setParameter("id", idPersonne);
            messages = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return messages;
    }

    public static List<Personne> getAllPersonnes() {
        List<Personne> personnes = new ArrayList<>();
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Personne> query = session.createQuery("FROM Personne", Personne.class);
            personnes = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return personnes;
    }

    public static Personne authenticateUser(String nom, String prenom, String motDePasse) {
        String hashedPassword = HashUtil.hashPassword(motDePasse);
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Personne> query = session.createQuery(
                "FROM Personne p WHERE p.nom = :nom AND p.prenom = :prenom AND p.motDePasse = :motDePasse", 
                Personne.class
            );
            query.setParameter("nom", nom);
            query.setParameter("prenom", prenom);
            query.setParameter("motDePasse", hashedPassword);
            
            List<Personne> results = query.getResultList();
            return !results.isEmpty() ? results.get(0) : null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Additional helper methods for CRUD operations
    
    public static void saveMessage(Message message) {
        Transaction transaction = null;
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(message);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
    public static Personne getPersonneById(int idPersonne) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Personne.class, idPersonne);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Message getMessageById(int idMessage) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Message.class, idMessage);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}