<%-- 
    Document   : pred
    Created on : 5 Jun, 2024, 11:53:55 AM
    Author     : sharw
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="prediction.PredDAO" %>
<%@ page import="prediction.Prediction" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>prediction</title>
        <link rel="stylesheet" type="text/css" href="css/style2.css">
    </head>
    <body>
          <h1>Predictions</h1>
    <form action="addPredictionRecord" method="post">
        <label for="productionUnits">Production Units:</label>
        <input type="number" id="productionUnits" name="productionUnits" required><br>
        <label for="costPrice">Cost Price:</label>
        <input type="number" step="0.01" id="costPrice" name="costPrice" required><br>
        <label for="sellingPrice">Selling Price:</label>
        <input type="number" step="0.01" id="sellingPrice" name="sellingPrice" required><br>
        <button type="submit">Add Prediction</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Production Units</th>
                <th>Cost Price</th>
                <th>Selling Price</th>
                <th>Profit</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Prediction> predictions = null;
                try (Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system")) {
                    PredDAO predDAO = new PredDAO(connection);
                    predictions = predDAO.getAllPredictions();
                    for (Prediction prediction : predictions) {
                        double profit = prediction.getSellingPrice() - prediction.getCostPrice();
                        out.println("<tr>");
                        out.println("<td>" + prediction.getProductionUnits() + "</td>");
                        out.println("<td>" + prediction.getCostPrice() + "</td>");
                        out.println("<td>" + prediction.getSellingPrice() + "</td>");
                        out.println("<td>" + profit + "</td>");
                        out.println("</tr>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>

    <div id="profitChart" style="width:100%; height:400px;"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var predictions = <%= predictions != null ? predictions : new ArrayList<>() %>;
            var profitData = [];
            var categories = [];

            predictions.forEach(function(prediction) {
                var profit = prediction.sellingPrice - prediction.costPrice;
                profitData.push(profit);
                categories.push('Record ' + prediction.id);
            });

            Highcharts.chart('profitChart', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Profit Increase Over Time'
                },
                xAxis: {
                    categories: categories
                },
                yAxis: {
                    title: {
                        text: 'Profit'
                    }
                },
                series: [{
                    name: 'Profit',
                    data: profitData
                }]
            });
        });
    </script>
    </body>
</html>
