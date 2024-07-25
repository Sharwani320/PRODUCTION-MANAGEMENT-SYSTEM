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
import dao.UserDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDAO {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USERNAME = "system";
    private static final String PASSWORD = "system";

    public List<Department> getAllDepartments() {
        List<Department> departments = new ArrayList<>();
        try (Connection connection = dao.UserDAO.getConnection();) {
            String query = "SELECT * FROM depts order by dept_id";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Department department = new Department();
                        department.setId(resultSet.getInt("DEPT_ID"));
                        department.setName(resultSet.getString("DEPT_NAME"));
                        department.setDescription(resultSet.getString("DEPT_DESCRIPTION"));
                        department.setProductionUnits(resultSet.getInt("DEPT_PRODUCTION_UNITS"));
                        department.setTargetDate(resultSet.getDate("DEPT_TARGET_DATE"));
                        department.setTargetUnits(resultSet.getInt("DEPT_TARGET_UNITS"));
                        departments.add(department);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.print(departments);
        return departments;
    }
    
    // Inside DeptDAO class
    public List<Department> searchDepartments(String searchQuery) {
        List<Department> departments = new ArrayList<>();
        try {
            Connection conn1 = UserDAO.getConnection();
            String query1 = "SELECT * FROM depts WHERE dept_name LIKE ? OR dept_description LIKE ?";
            PreparedStatement stmt = conn1.prepareStatement(query1);
            stmt.setString(1, "%" + searchQuery + "%");
            stmt.setString(2, "%" + searchQuery + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Department dept = new Department();
                dept.setId(rs.getInt("dept_id"));
                dept.setName(rs.getString("dept_name"));
                dept.setDescription(rs.getString("dept_description"));
                departments.add(dept);
            }
            rs.close();
            stmt.close();
            conn1.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return departments;
}


    public static class Department {
        private int id;
        private String name;
        private String description;
        private int productionUnits;
        private java.util.Date targetDate;
        private int targetUnits;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public int getProductionUnits() {
            return productionUnits;
        }

        public void setProductionUnits(int productionUnits) {
            this.productionUnits = productionUnits;
        }

        public java.util.Date getTargetDate() {
            return targetDate;
        }

        public void setTargetDate(java.util.Date targetDate) {
            this.targetDate = targetDate;
        }

        public int getTargetUnits() {
            return targetUnits;
        }

        public void setTargetUnits(int targetUnits) {
            this.targetUnits = targetUnits;
        }
    }
    
    public static void main(String args[]){
    DeptDAO myobj = new DeptDAO();
   List<Department> list_dept =  myobj.searchDepartments("PPM");
   System.out.println(list_dept.toString());
    }
}
