 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%String id = request.getParameter("deptId");
        String name = request.getParameter("deptName");
        String description = request.getParameter("deptDescription");
      //  int productionUnits = Integer.parseInt(request.getParameter("deptProductionUnits"));
      //  String targetDate = request.getParameter("deptTargetDate");
       // int targetUnits = Integer.parseInt(request.getParameter("deptTargetUnits"));
try {Connection connection = dao.UserDAO.getConnection(); 
           String query = "INSERT INTO depts (DEPT_ID, DEPT_NAME, DEPT_DESCRIPTION) VALUES (?, ?, ?)";
          PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, Integer.parseInt(id));
                statement.setString(2, name);
                statement.setString(3, description);
               // statement.setInt(4, productionUnits);
              //  statement.setString(5, targetDate);
              //  statement.setInt(6, targetUnits);
                statement.executeUpdate();


}catch(Exception e){
out.println(e.getMessage());
}
        
        %>