<%@page import ="login.login"%>

<% 
String username = request.getParameter("username");
String password = request.getParameter("password");

login loginObject = new login(username, password);

boolean valid_login = loginObject.validate_login();

if(valid_login == true){
    session.setAttribute("username", loginObject.getUsername());
    session.setAttribute("password", loginObject.getPassword());
  //  response.sendRedirect("dashboard.jsp");

}
out.println(valid_login);

 %>
