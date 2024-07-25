/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prediction;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sharw
 */
@WebServlet("/AddDataServlet")
public class AddDataServlet extends HttpServlet{
     private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productionUnits = request.getParameter("production_units");
        String costPrice = request.getParameter("cost_price");
        String sellingPrice = request.getParameter("selling_price");
        double profit = Double.parseDouble(sellingPrice) - Double.parseDouble(costPrice);

        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "system";
        String password = "system";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "INSERT INTO production_data7 (production_units, cost_price, selling_price, profit) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, productionUnits);
            statement.setString(2, costPrice);
            statement.setString(3, sellingPrice);
            statement.setDouble(4, profit);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<p>Data added successfully.</p>");
            }

            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error adding data: " + e.getMessage() + "</p>");
        }
    }
}
    

