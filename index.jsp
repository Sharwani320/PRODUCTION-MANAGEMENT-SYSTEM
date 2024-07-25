<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
</head>
<body>
    <%@include file="nav.jsp" %>
    <div class="container">
        <h2>Login Page</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" value="Login" id="login_btn">

        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p> <!-- Link to the sign-up page -->
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/handle.js"></script>
</body>
</html>

