
<%@ page import="depts.DeptDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="depts.DeptDAO.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Departments</title>
    <link rel="stylesheet" type="text/css" href="css/dept.css">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container">
        <h1>All Departments</h1>
        <div class="addButtondiv">
            <button class="button addButton" id="openModalBtn">ADD</button>
        </div>
        <table id="departmentsTable" border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Edit or Delete</th>
                    <th>Manage Prod.</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String searchQuery = request.getParameter("search");
                    List<depts.DeptDAO.Department> departments = null;
                    
                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        departments = new DeptDAO().searchDepartments(searchQuery);
                    } else {
                        departments = new DeptDAO().getAllDepartments();
                    }
                    
                    if (departments != null) {
                        for (depts.DeptDAO.Department dept : departments) {
                %>
                    <tr>
                        <td><%= dept.getId() %></td>
                        <td><%= dept.getName() %></td>
                        <td><%= dept.getDescription() %></td>
                        <td>
                            <button class="button editButton"><img src="icons/edit-line.png"></button>
                            <button class="button deleteButton"><img src="icons/delete-bin-6-line.png"></button>
                        </td>
                        <td><a href="dept_record.jsp?deptId=<%=dept.getId()%>">Manage</a></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form id="editForm">
                <input type="hidden" id="editId" name="editId">
                <label for="editName">Name:</label>
                <input type="text" id="editName" name="editName" required>
                <label for="editDescription">Description:</label>
                <input type="text" id="editDescription" name="editDescription" required>
                <label for="editProductionUnits">Production Units:</label>
                <input type="number" id="editProductionUnits" name="editProductionUnits" required>
                <label for="editTargetDate">Target Date:</label>
                <input type="date" id="editTargetDate" name="editTargetDate" required>
                <label for="editTargetUnits">Target Units:</label>
                <input type="number" id="editTargetUnits" name="editTargetUnits" required>
                <input type="submit" value="Update" style="width: 100%">
            </form>
        </div>
    </div>

    <!-- Add Modal -->
    <div id="myModal" class="modal" style="top: 0">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Add Department</h2>
            <form id="deptForm">
                <label for="deptId">Department ID:</label>
                <input type="text" id="deptId" name="deptId" required><br><br>
                <label for="deptName">Department Name:</label>
                <input type="text" id="deptName" name="deptName" required><br><br>
                <label for="deptDescription">Department Description:</label>
                <textarea id="deptDescription" name="deptDescription" required></textarea><br><br>
                <button type="submit">Add Department</button>
            </form>
        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/departments.js"></script>
</body>
</html>
