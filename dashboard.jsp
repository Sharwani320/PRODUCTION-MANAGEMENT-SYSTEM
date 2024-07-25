<%-- 
    Document   : dashboard.jsp
    Created on : 15 May, 2024, 10:06:29 AM
    Author     : ABHISHEK
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@page import="dao.UserDAO.getConnection()"%>--%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/dept.css">
</head>
<body>
    <%@include file="nav.jsp" %>
    <h1>Welcome to the Dashboard</h1>
    <div style="display: flex; flex-direction: row">
        <div class="container" style="height: 700px; margin-left: 100px; width: 400px" >
            <h1>Departments</h1>
            <%
                Connection conn5 = UserDAO.getConnection();
                String query5 = "Select dept_name from depts";
               
                Statement stmt5 = conn5.createStatement();
                ResultSet rs5 = stmt5.executeQuery(query5);
                
                while (rs5.next()) {
                    String deptName = rs5.getString("dept_name");
                    
            %>
            
            <ul style="font-size: 25px; margin: 20px">
                <li><%= deptName %></li>
            </ul>
            
            <%
                }
                
            %>
        </div>
        <div style="width: 75%; display: flex; flex-direction: column">
            <div style="">
                <%@include file="bar.jsp"%>
            </div>
            <div>
                <%@include file="total_line.jsp"%>
            </div>
            <div>
                <%@include file="pie.jsp" %>
            </div>
        </div>

    </div>
</body>
</html>
