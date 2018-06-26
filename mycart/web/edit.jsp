<%-- 
    Document   : edit
    Created on : 25-Jun-2018, 23:59:03
    Author     : Shashank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart</title>
    </head>
    <body>
                  <%
                
                try
                {   
                    int id=Integer.parseInt(request.getParameter("userid"));
                    String username=request.getParameter("username");
             String email=request.getParameter("email");
             String password=request.getParameter("password");
              String mob=request.getParameter("mob");
            String city=request.getParameter("city");
            String dob=request.getParameter("dob");
           
           Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection cn;
              cn=DriverManager.getConnection("jdbc:derby://localhost:1527/mycart;user=shashank;password=shasha4u");
              
              PreparedStatement pst;
              pst=cn.prepareStatement("update signup set username='"+username+"', email='"+email+"', password='"+password+"', mob='"+mob+"', city='"+city+"', dob='"+dob+"'   where id="+id+"");
               int xx=pst.executeUpdate();
              if(xx==1)
              {  
                  session.setAttribute("username", username);
                  RequestDispatcher rd = request.getRequestDispatcher("profie.jsp");
                  rd.include(request,response);
              }
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            
            
  %> 
    </body>
</html>
