/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import static dao.UserDAO.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ABHISHEK
 */
public class login {

    private String username;
    private String password;

    public login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @SuppressWarnings("finally")
    public boolean validate_login() {
        Connection conn = null;
        boolean login_status = false;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from users1 where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.username = rs.getString(1);
                login_status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return login_status;
        }
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }
}