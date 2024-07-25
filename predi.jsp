<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Predictions</title>
    <style>
        body {
            margin: 4rem;
        }

        #formContainer {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input {
            width: 300px;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            margin: 10px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            border-collapse: collapse;
            margin-bottom: 20px;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #0000FF;
            color: #fff;
        }
    </style>
</head>

<body>
    <jsp:include page="nav.jsp"/>
    <h1 style="color: blue;">Steel Plant</h1>
    <h2>Predictions</h2>

    <div id="formContainer">
        <form action="AddPredictionRecord" method="post">
            <label for="productionUnits">Production Units:</label>
            <input type="number" id="productionUnits" name="productionUnits" placeholder="Enter production units" required>

            <label for="costPrice">Cost Price:</label>
            <input type="number" id="costPrice" name="costPrice" placeholder="Enter cost price" required>

            <label for="sellingPrice">Selling Price:</label>
            <input type="number" id="sellingPrice" name="sellingPrice" placeholder="Enter selling price" required>

            <button type="submit">Add</button>
        </form>
    </div>

    <table>
        <tr>
            <th>Production Units</th>
            <th>Cost Price</th>
            <th>Selling Price</th>
            <th>Profit / Loss</th>
        </tr>
        <%
            try {
                UserDAO userDAO = new UserDAO();
                Connection conn = userDAO.getConnection();
                String query = "SELECT production_units, cost_price, selling_price, (selling_price - cost_price) AS profit FROM pred5";
                PreparedStatement pstmt = conn.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    int productionUnits = rs.getInt("production_units");
                    double costPrice = rs.getDouble("cost_price");
                    double sellingPrice = rs.getDouble("selling_price");
                    double profit = rs.getDouble("profit");
        %>
        <tr>
            <td><%= productionUnits %></td>
            <td><%= costPrice %></td>
            <td><%= sellingPrice %></td>
            <td><%= profit %></td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
    </table>
    <div>
        <jsp:include page="lines.jsp"/>
    </div>
</body>
</html>