<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Production by Department</title>
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
        <h1>Daily Production Records for All Departments</h1>
        <div id="production-line-chart"></div>
        
        <%
            UserDAO userDAO1 = new UserDAO();
            Connection conn1 = userDAO1.getConnection();

            String query2 = "SELECT dp.dept_id, d.dept_name, dp.production_date, dp.production_units " +
                           "FROM daily_production dp " +
                           "JOIN depts d ON dp.dept_id = d.dept_id " +
                           "ORDER BY dp.production_date, dp.dept_id";
            Statement stmt2 = conn1.createStatement();
            ResultSet rs1 = stmt2.executeQuery(query2);

            Map<String, List<String>> deptDates = new HashMap<String, List<String>>();
            Map<String, List<Integer>> deptProduction = new HashMap<String, List<Integer>>();
            Set<String> categories = new TreeSet<String>();

            while (rs1.next()) {
                String deptName = rs1.getString("dept_name");
                String productionDate = rs1.getDate("production_date").toString();
                int productionUnits = rs1.getInt("production_units");

                categories.add(productionDate);

                if (!deptDates.containsKey(deptName)) {
                    deptDates.put(deptName, new ArrayList<String>());
                    deptProduction.put(deptName, new ArrayList<Integer>());
                }

                deptDates.get(deptName).add(productionDate);
                deptProduction.get(deptName).add(productionUnits);
            }

            rs1.close();
            stmt2.close();
            conn1.close();

            // JavaScript to generate Highcharts series data
            StringBuilder seriesData = new StringBuilder();
            seriesData.append("[");
            boolean firstSeries = true;
            for (String deptName : deptDates.keySet()) {
                if (!firstSeries) {
                    seriesData.append(",");
                }
                seriesData.append("{");
                seriesData.append("name: '").append(deptName).append("',");
                seriesData.append("data: [");

                List<String> dates = deptDates.get(deptName);
                List<Integer> productions = deptProduction.get(deptName);
                Map<String, Integer> dateProductionMap = new HashMap<String, Integer>();
                for (int i = 0; i < dates.size(); i++) {
                    dateProductionMap.put(dates.get(i), productions.get(i));
                }

                boolean firstData = true;
                for (String date : categories) {
                    if (!firstData) {
                        seriesData.append(",");
                    }
                    seriesData.append(dateProductionMap.getOrDefault(date, 0));
                    firstData = false;
                }

                seriesData.append("]");
                seriesData.append("}");
                firstSeries = false;
            }
            seriesData.append("]");
        %>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Highcharts.chart('production-line-chart', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Daily Production for All Departments'
                    },
                    xAxis: {
                        categories: <%= categories.toString() %>,
                        title: {
                            text: 'Date'
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Production Units'
                        }
                    },
                    tooltip: {
                        valueSuffix: ' units'
                    },
                    series: <%= seriesData.toString() %>
                });
            });
        </script>
    </div>
</body>
</html>
