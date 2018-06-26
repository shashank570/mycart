<%-- 
    Document   : logout
    Created on : 24-Jun-2018, 19:16:09
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart</title>
    </head>
    <body>
        
        <%
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);
%> 
        
        
        <%
            session.removeAttribute("username");
            session.invalidate();
               %>
               <jsp:forward page="index.html" />
    </body>
</html>
