<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Production</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/dept.css">

</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div style="display: flex; margin: 10px; margin-top: 30px">
        <%
           String dept_id =null;
            try {
                        UserDAO userDAO = new UserDAO();
                        Connection conn = userDAO.getConnection();
                         dept_id = request.getParameter("deptId");
//                         out.println(dept_id);
                        String query = "SELECT * FROM depts WHERE dept_id = ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, Integer.parseInt(dept_id));
                        ResultSet rs1 = pstmt.executeQuery();
                        String dept_Name = null;
                        String deptTargetDate = null;
                        String deptDesc = null;
                        int deptTargetUnits = 0;

                        if (rs1.next()) {
                            dept_Name = rs1.getString("dept_name");
                            deptTargetDate = rs1.getDate("dept_target_date").toString();
                            deptDesc = rs1.getString("dept_description");
                            deptTargetUnits = rs1.getInt("dept_target_units");
                        }
                        
        %>
        <div style="display: flex; flex-direction: column; margin: auto; position: static">
            <div class="container" style=" height: 300px; margin-left: auto; margin-right: auto;">
                <h1 style="color: #333; text-align: center; margin-bottom: 20px;"><%= dept_Name %> Dept</h1>

                <h3 style="color: #333; margin-bottom: 10px;">Description:</h3>
                <p style="color: #555; margin-bottom: 20px;"><%= deptDesc %></p>

                <h3 style="color: #333; margin-bottom: 10px;">Deadline for Target Production:</h3>
                <p style="color: #555; margin-bottom: 20px;"><%= deptTargetDate %></p>

                <h3 style="color: #333; margin-bottom: 10px;">Target Production Units:</h3>
                <p style="color: #555;"><%= deptTargetUnits %></p>
                <a href="predi.jsp" style="display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">Predictions</a>
            </div>
            <div >
                <jsp:include page="line.jsp"/>
            </div>
        </div>
    
    <div class="container" style="width: 70%; margin-right: auto; heigh ">
        <h1>Daily Production Records</h1>
        <table>
            <thead>
                <tr>
                    <!--<th>Department ID</th>-->
                    <!--<th>Department Name</th>-->
                    <th>Production Date</th>
                    <th>Production Units</th>
                    <!--<th>Added By</th>-->
                </tr>
            </thead>
            <tbody>
                <%
//                    try {
//                        UserDAO userDAO = new UserDAO();
//                        Connection conn = userDAO.getConnection();
//                        String dept_id = request.getParameter("deptId");
//                        out.println(dept_id);
                        String query1 = "SELECT dp.dept_id, d.dept_name, dp.production_date, dp.production_units FROM daily_production dp JOIN depts d ON dp.dept_id = d.dept_id and d.dept_id =? order by dp.production_date";
                        PreparedStatement pstmt1 = conn.prepareStatement(query1);
                        pstmt1.setInt(1, Integer.parseInt(dept_id));
                        ResultSet rs = pstmt1.executeQuery();

                        while (rs.next()) {
                            int deptId = rs.getInt("dept_id");
                            String deptName = rs.getString("dept_name");
                            String productionDate = rs.getDate("production_date").toString();
                            int productionUnits = rs.getInt("production_units");
                %>
                <tr>
                    <!--<td><%= deptId %></td>-->
                    <!--<td><%= deptName %></td>-->
                    <td><%= productionDate %></td>
                    <td><%= productionUnits %></td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                      out.println(e.getMessage());
                    }
                %>
            </tbody>
        </table>

        <div class="form-container">
            <h2>Add Daily Production</h2>
            <form action="AddProductionRecord" method="post">
                <!--<label for="deptId">Department ID:</label>-->
                <input type="hidden" id="deptId" name="deptId" value="<%=Integer.parseInt(dept_id)%>" readonly required><br>
                <label for="productionDate">Production Date:</label>
                <input type="date" id="productionDate" name="productionDate" required><br>
                <label for="productionUnits">Production Units:</label>
                <input type="number" id="productionUnits" name="productionUnits" required><br>
                <button type="submit">Add Record</button>
            </form>
        </div>
    </div>
    </div>
</body>
</html>
