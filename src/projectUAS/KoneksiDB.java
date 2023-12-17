/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectUAS;

import projectUAS.*;
import java.sql.*;

/**
 *
 * @author ALDII
 */
public class KoneksiDB {
    // membuat variable bertipe Connection
    private static Connection koneksi;

    public static Connection getKoneksi() {
        if (koneksi == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/db_tiketbioskop";
                String username = "root";
                String password = "";

                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

                koneksi = DriverManager.getConnection(url, username, password);
            } catch (SQLException e) {
                System.out.println("Gagal membuat koneksi");
            }
        }
        return koneksi;
    }

    public static void closeConnection() {
        if (koneksi != null) {
            try {
                koneksi.close();
                System.out.println("Koneksi ditutup");
            } catch (SQLException e) {
                System.out.println("Gagal menutup koneksi");
            } finally {
                koneksi = null; // Set to null to allow reconnection if needed
            }
        }
    }
}

