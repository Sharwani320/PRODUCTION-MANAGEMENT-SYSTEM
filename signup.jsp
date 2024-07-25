<%-- 
    Document   : signup.jsp
    Created on : 15 May, 2024, 9:20:37 AM
    Author     : ABHISHEK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="signup.js"></script>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form id="signupForm" action="signup.jsp" method="post"> <!-- Change action to signup.jsp -->
            <input type="hidden" id="userId" name="userId">
            <label for="newUsername">Username:</label>
            <input type="text" id="newUsername" name="newUsername" required><br><br>
            <label for="newPassword">Password:</label>
            <input type="password" id="newPassword" name="newPassword" required><br><br>
            <input type="submit" value="Sign Up">
        </form>
        <p>Already have an account? <a href="index.jsp">Login</a></p> <!-- Link to the login page -->
    </div>
</body>
</html>
