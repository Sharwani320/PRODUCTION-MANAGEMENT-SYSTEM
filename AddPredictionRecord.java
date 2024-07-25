/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prediction;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;


/**
 *
 * @author sharw
 */
@WebServlet("/AddPredictionRecord")
public class AddPredictionRecord extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productionUnits = Integer.parseInt(request.getParameter("productionUnits"));
        double costPrice = Double.parseDouble(request.getParameter("costPrice"));
        double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
        double profit = sellingPrice - costPrice;
        int pred_id = 0;
        try {
            UserDAO userDAO = new UserDAO();
            Connection conn = userDAO.getConnection();
            PreparedStatement ps_id = conn.prepareStatement("SELECT COALESCE(MAX(id), 0) + 1 FROM pred5");
            ResultSet rs_id = ps_id.executeQuery();
            if (rs_id.next()) {
                pred_id = rs_id.getInt(1);
            }
            
            String sql = "INSERT INTO pred5 (id, production_units, cost_price, selling_price, profit) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, pred_id);
            stmt.setInt(2, productionUnits);
            stmt.setDouble(3, costPrice);
            stmt.setDouble(4, sellingPrice);
            stmt.setDouble(5, profit);

            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("predi.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
    

