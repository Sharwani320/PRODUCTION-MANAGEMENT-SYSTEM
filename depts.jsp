<%@ page import="java.util.*" %>
<%@ page import="depts.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Departments</title>
    <link rel="stylesheet" type="text/css" href="dept.css">
</head>
<body>
    <h1>All Departments</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Production Units</th>
                <th>Target Date</th>
                <th>Target Units</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Retrieve departments using DeptDAO
            DeptDAO deptDAO = new DeptDAO();
            List<DeptDAO.Department> departments = deptDAO.getAllDepartments();
            for (DeptDAO.Department department : departments) {
            %>
            <tr>
                <td><%= department.getId() %></td>
                <td><%= department.getName() %></td>
                <td><%= department.getDescription() %></td>
                <td><%= department.getProductionUnits() %></td>
                <td><%= department.getTargetDate() %></td>
                <td><%= department.getTargetUnits() %></td>
                <td>
                    <button class="button editButton" ><img src="icons/edit-line.png"></button>
                    <button class="button deleteButton"><img src="icons/delete-bin-6-line.png"></button>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
