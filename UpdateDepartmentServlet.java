/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package depts;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USERNAME = "system";
    private static final String PASSWORD = "system";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("editId"));
        String name = request.getParameter("editName");
        String description = request.getParameter("editDescription");
        int productionUnits = Integer.parseInt(request.getParameter("editProductionUnits"));
        String targetDate = request.getParameter("editTargetDate");
        int targetUnits = Integer.parseInt(request.getParameter("editTargetUnits"));

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            String query = "UPDATE depts SET DEPT_NAME = ?, DEPT_DESCRIPTION = ?, DEPT_PRODUCTION_UNITS = ?, DEPT_TARGET_DATE = to_date(?,'YYYY-MM-DD'), DEPT_TARGET_UNITS = ? WHERE DEPT_ID = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, name);
                statement.setString(2, description);
                statement.setInt(3, productionUnits);
                statement.setString(4, targetDate);
                statement.setInt(5, targetUnits);
                statement.setInt(6, id);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
