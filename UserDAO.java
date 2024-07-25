/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    @SuppressWarnings("finally")
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            return conn;
        }
    }

    public static void main(String[] args) {
        Connection conn = dao.UserDAO.getConnection();
        String user_uid = "", user_pwd = "", user_name = "";
        // System.out.println(conn);
        try {
            PreparedStatement ps = conn.prepareStatement("select * from users1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user_uid = rs.getString(1);
                user_pwd = rs.getString(2);
                user_name = rs.getString(3);
                System.out.println(user_uid + "===" + user_pwd + "===" + user_name);
            }

        } catch (Exception e) {

        }
    }

}
