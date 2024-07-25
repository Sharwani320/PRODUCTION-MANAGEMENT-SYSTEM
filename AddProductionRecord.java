/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package depts;

/**
 *
 * @author ABHISHEK
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;
import java.sql.ResultSet;

@WebServlet("/AddProductionRecord")
public class AddProductionRecord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deptId = Integer.parseInt(request.getParameter("deptId"));
        String productionDate = request.getParameter("productionDate");
        int productionUnits = Integer.parseInt(request.getParameter("productionUnits"));
        int prod_id=0;
        try {
            UserDAO userDAO = new UserDAO();
            Connection conn = userDAO.getConnection();
            PreparedStatement ps_id=conn.prepareStatement("select nvl(max(nvl(id,0)),0)+1 from daily_production");
            ResultSet rs_id=ps_id.executeQuery();
            if(rs_id.next()){
            prod_id= Integer.parseInt(rs_id.getString(1));
            }
            
            String sql = "INSERT INTO daily_production (id,dept_id, production_date, production_units) VALUES (?,?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
             stmt.setInt(1, prod_id);
            stmt.setInt(2, deptId);
            stmt.setDate(3, java.sql.Date.valueOf(productionDate));
            stmt.setInt(4, productionUnits);

            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("dailyProduction.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
