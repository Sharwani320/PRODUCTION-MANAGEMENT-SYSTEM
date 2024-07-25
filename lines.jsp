<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Production Units vs Profit</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include Highcharts Library -->
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
        #production-line-chart {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Production Units vs Profit</h1>
        <div id="production-line-chart"></div>
        
        <%
            UserDAO userDAO = new UserDAO();
            Connection conn = userDAO.getConnection();

            String query = "SELECT production_units, profit FROM pred5 ORDER BY id";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            List<Integer> productionUnitsList = new ArrayList<Integer>();
            List<Double> profitList = new ArrayList<Double>();

            while (rs.next()) {
                int productionUnits = rs.getInt("production_units");
                double profit = rs.getDouble("profit");

                productionUnitsList.add(productionUnits);
                profitList.add(profit);
            }

            rs.close();
            stmt.close();
            conn.close();

            // Convert Java Lists to JavaScript arrays
            StringBuilder productionUnitsJSArray = new StringBuilder();
            StringBuilder profitJSArray = new StringBuilder();
            productionUnitsJSArray.append("[");
            profitJSArray.append("[");
            for (int i = 0; i < productionUnitsList.size(); i++) {
                if (i > 0) {
                    productionUnitsJSArray.append(",");
                    profitJSArray.append(",");
                }
                productionUnitsJSArray.append(productionUnitsList.get(i));
                profitJSArray.append(profitList.get(i));
            }
            productionUnitsJSArray.append("]");
            profitJSArray.append("]");
        %>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Highcharts.chart('production-line-chart', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Production Units vs Profit'
                    },
                    xAxis: {
                        title: {
                            text: 'Production Units'
                        },
                        categories: <%= productionUnitsJSArray.toString() %>
                    },
                    yAxis: {
                        title: {
                            text: 'Profit'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ' units'
                    },
                    series: [{
                        name: 'Profit',
                        data: <%= profitJSArray.toString() %>
                    }]
                });
            });
        </script>
    </div>
</body>
</html>