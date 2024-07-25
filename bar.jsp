<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Total Production by Department</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include Highcharts Library -->
    <script src="js/highcharts.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            padding: 20px;
        }
        #production-bar-chart {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Total Production by Department</h1>
        <div id="production-bar-chart"></div>
        
        <%
            UserDAO userDAO = new UserDAO();
            Connection conn = userDAO.getConnection();

            String query = "SELECT d.dept_name AS dept_name, SUM(dp.production_units) AS total_production " +
                           "FROM daily_production dp " +
                           "JOIN depts d ON dp.dept_id = d.dept_id " +
                           "GROUP BY d.dept_name";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            StringBuilder deptNames = new StringBuilder();
            StringBuilder totalProductions = new StringBuilder();

            deptNames.append("[");
            totalProductions.append("[");

            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    deptNames.append(",");
                    totalProductions.append(",");
                }
                deptNames.append("'").append(rs.getString("dept_name")).append("'");
                totalProductions.append(rs.getInt("total_production"));
                first = false;
            }

            deptNames.append("]");
            totalProductions.append("]");

            rs.close();
            stmt.close();
            conn.close();
        %>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Highcharts.chart('production-bar-chart', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Total Production by Department'
                    },
                    xAxis: {
                        categories: <%= deptNames.toString() %>,
                        title: {
                            text: 'Departments'
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Total Production Units',
                            align: 'high'
                        }
                    },
                    tooltip: {
                        valueSuffix: ' units'
                    },
                    series: [{
                        name: 'Production Units',
                        data: <%= totalProductions.toString() %>
                    }]
                });
            });
        </script>
    </div>
</body>
</html>
