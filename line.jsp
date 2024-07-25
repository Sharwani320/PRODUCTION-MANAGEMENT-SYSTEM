<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Production Records</title>
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
            margin-top: 10px;
        }
        #production-chart {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Daily Production Records</h1>
        <div id="production-chart"></div>
        
        <%
            UserDAO userDAO = new UserDAO();
            Connection conn = userDAO.getConnection();
            String dept_id = request.getParameter("deptId");

            String query = "SELECT production_date, production_units FROM daily_production WHERE dept_id = ? ORDER BY production_date";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(dept_id));
            ResultSet rs = pstmt.executeQuery();

            StringBuilder dates = new StringBuilder();
            StringBuilder units = new StringBuilder();

            dates.append("[");
            units.append("[");

            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    dates.append(",");
                    units.append(",");
                }
                dates.append("'").append(rs.getDate("production_date")).append("'");
                units.append(rs.getInt("production_units"));
                first = false;
            }

            dates.append("]");
            units.append("]");

            rs.close();
            pstmt.close();
            conn.close();
        %>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Highcharts.chart('production-chart', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Daily Production Records'
                    },
                    xAxis: {
                        categories: <%= dates.toString() %>,
                        title: {
                            text: 'Date'
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Production Units'
                        }
                    },
                    series: [{
                        name: 'Production Units',
                        data: <%= units.toString() %>
                    }]
                });
            });
        </script>
    </div>
</body>
</html>
