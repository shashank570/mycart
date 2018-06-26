<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart</title>
    </head>
    <body>
        <%@ include file="header.html" %> 
        <%! int id;%>
        <div style='height:80%; width:100%; border: 2px solid blue; background-color: powderblue; margin-top:2px;  '>
<form action="delete.jsp"  method="post" style="background-color: powderred; height:90%; width:30%; margin-top:15px;">
   <div class="input-group">
     <label>Enter your User ID to deactivate account</label>
    <input type="text" placeholder="Enter User ID " name="userid" required>
  </div>
		<div class="input-group">
			<button type="submit" class="btn" name="submit">Deactivate Account</button>
		</div>
</form>
</div>
            <%
                try
                {
            id=Integer.parseInt(request.getParameter("userid"));
           Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection cn;
              cn=DriverManager.getConnection("jdbc:derby://localhost:1527/mycart;user=shashank;password=shasha4u");
              PreparedStatement pst;
              pst=cn.prepareStatement("delete from signup  where id="+id+"");
               int xx=pst.executeUpdate();
              if(xx==1)
              {
                  %>
                  <%
                      
                  session.removeAttribute("username");
                  session.invalidate();
                  out.print("<div style='height:10%; width:50%; border: 2px solid blue; background-color: powderblue; margin-top:2px; margin-left:25%; margin-right:25%; '>");
            
                  out.print("<b><h2 style='color:red; padding-left:10px; padding-top:5px;'>Your account has been successfully deactivated</h2></b>");
                  out.print("<b><h2 style= padding-left:10px; padding-top:5px;'>Click <a href=index.html> Exit </a> to leave</h2></b>");
                  out.print("</div>");
               }   
}
                 catch(Exception ex)
                {
                      System.out.println(ex);
                }
            %>
         </body>
</html>
