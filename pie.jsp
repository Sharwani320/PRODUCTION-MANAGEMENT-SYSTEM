<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Department Production Pie Charts</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.highcharts.com/highcharts.js"></script>
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
        .chart-container {
            width: 30%;
            float: left;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Department Production vs Target</h1>
        <%
            UserDAO userDAO2 = new UserDAO();
            Connection conn2 = userDAO2.getConnection();

            String query3 = "SELECT d.dept_id, d.dept_name, SUM(dp.production_units) as total_production, d.dept_target_units " +
                           "FROM depts d " +
                           "JOIN daily_production dp ON d.dept_id = dp.dept_id " +
                           "GROUP BY d.dept_id, d.dept_name, d.dept_target_units " +
                           "ORDER BY d.dept_id ";
            Statement stmt3 = conn2.createStatement();
            ResultSet rs3 = stmt3.executeQuery(query3);
            %>
            <div class="conntainer">
        <%        
            int chartCount = 1;
            while (rs3.next()) {
                String deptName = rs3.getString("dept_name");
                int totalProduction = rs3.getInt("total_production");
                int targetUnits = rs3.getInt("dept_target_units");

                String chartId = "chart" + chartCount;
        %>
        
            <div class="chart-container" style="width: 370px">
                    <div id="<%= chartId %>"></div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            Highcharts.chart('<%= chartId %>', {
                                chart: {
                                    type: 'pie'
                                },
                                title: {
                                    text: '<%= deptName %>'
                                },
                                series: [{
                                    name: 'Units',
                                    colorByPoint: true,
                                    data: [{
                                        name: 'Production Units',
                                        y: <%= totalProduction %>
                                    }, {
                                        name: 'Target Units',
                                        y: <%= targetUnits %>
                                    }]
                                }]
                            });
                        });
                    </script>
                </div>
          
        <%
                chartCount++;
            }

            rs3.close();
            stmt3.close();
            conn2.close();
        %>
        </div>  
    </div>
</body>
</html>
