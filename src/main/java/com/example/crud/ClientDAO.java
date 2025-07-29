package com.example.crud;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {
    public List<Client> getAllClients() {
        List<Client> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM client");
            while (rs.next()) {
                Client c = new Client();
                c.setNumtel_client(rs.getString("numtel_client"));
                c.setNom_client(rs.getString("nom_client"));
                c.setSexe_client(rs.getString("sexe_client"));
                c.setAge_client(rs.getInt("age_client"));
                c.setSolde_client(rs.getInt("solde_client"));
                c.setMail_client(rs.getString("mail_client"));
                list.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void insertClient(Client client) {
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO client (numtel_client, nom_client, sexe_client, age_client, solde_client, mail_client) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, client.getNumtel_client());
            ps.setString(2, client.getNom_client());
            ps.setString(3, client.getSexe_client());
            ps.setInt(4, client.getAge_client());
            ps.setInt(5, client.getSolde_client());
            ps.setString(6, client.getMail_client());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Client getClientByNumTel(String numtel) {
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM client WHERE numtel_client = ?");
            ps.setString(1, numtel);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Client c = new Client();
                c.setNumtel_client(rs.getString("numtel_client"));
                c.setNom_client(rs.getString("nom_client"));
                c.setSexe_client(rs.getString("sexe_client"));
                c.setAge_client(rs.getInt("age_client"));
                c.setSolde_client(rs.getInt("solde_client"));
                c.setMail_client(rs.getString("mail_client"));
                return c;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public int updateClient(Client client) {
        String sql = "UPDATE client " +
                     "SET nom_client=?, sexe_client=?, age_client=?, solde_client=?, mail_client=? " +
                     "WHERE numtel_client=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
    
            ps.setString(1, client.getNom_client());
            ps.setString(2, client.getSexe_client());
            ps.setInt(3, client.getAge_client());
            ps.setInt(4, client.getSolde_client());
            ps.setString(5, client.getMail_client());
            ps.setString(6, client.getNumtel_client());
    
            return ps.executeUpdate(); // returns number of updated rows
        } catch (Exception e) {
            // Choose either to rethrow a checked SQLException or wrap:
            throw new RuntimeException("Erreur lors de la mise à jour du client: " + client.getNumtel_client(), e);
        }
    }
    
    public int deleteClient(String numtel) {
        String sql = "DELETE FROM client WHERE numtel_client = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
    
            ps.setString(1, numtel);
            return ps.executeUpdate(); // returns number of deleted rows
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de la suppression du client: " + numtel, e);
        }
    }
    
}


