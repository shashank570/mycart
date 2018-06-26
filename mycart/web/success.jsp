

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart</title>
    </head>
    <body>
         <%@ include file="header.html" %> 
         <%@ page import="java.sql.*" %>
         
         <%
            
            String un=(String)session.getAttribute("username");
            out.print("<div style='height:50%; width:100%; border: 2px solid red; background-color: powderblue;'>");
            out.println("<h1>Welcome <b style='color:red;'> "+un+"</b></h1>");
            out.println("<b><h3>Please <a href='#' onclick='div_show()'>Login</a> to proceed</h3></b>");
            out.print("</div>");
            %>
         
            
            
            
           
         
    </body>
</html>
