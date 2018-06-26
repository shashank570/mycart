<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <title>MyCart</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="elements.css" rel="stylesheet">
<script src="my_js.js"></script>
</head>
    <body>
        
        
        <div>
		<nav class="navbar navbar-inverse" style="background-color: #5858da;"  >
  <div class="container-fluid">
    <div class="navbar-header">
    	<img src="images/1.png" height="50px" width="100px">
      <a class="navbar-brand" href="#" style="color: black; font-size: 35px; font-family: Snap ITC;">MyCart</a>
    </div>

<form class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text" class="form-control"  size="50" placeholder="Search for products, brands and more">
      </div>
      <button type="submit" class="btn btn-default">Search</button>
    </form>

    
    
    <ul class="nav navbar-nav navbar-right">
    	 <li>
    	 	
             <div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: 8px;">More
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="cc.jsp">Customer Care</a></li>
    <li><a href="#" onclick="div_show2()">Contact us</a></li>
    <li><a href="aboutus.html">About us</a></li>
  </ul>
</div>
    	 </li>
      <li><a href="#" style="color: black; font-size: 20px;"  ><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      <li>
    	 	<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: 8px;">My Account
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="profie.jsp">View Profile</a></li>
    <li><a href="#">Wishlist</a></li>
    <li><a href="logout.jsp">logout</a></li>
  </ul>
</div>
    	 </li>
       </ul> 
  </div>
</nav>



<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Electronics
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Mobiles</a></li>
          <li><a href="#">Mobiles Accessories</a></li>
          <li><a href="#">Laptop</a></li>
          <li><a href="#">Laptop Accessories</a></li>
          <li><a href="#">Camera</a></li>
          <li><a href="#">Game & Accessories</a></li>
          <li><a href="#">Tablets</a></li>
          <li><a href="#">Home Entertainment</a></li>
        </ul>
      </li>

      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >TV & Appliances
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">TVs</a></li>
          <li><a href="#">Ultra HD TVs</a></li>
          <li><a href="#">Refrigrator</a></li>
          <li><a href="#">Washing Machies</a></li>
          <li><a href="#">Kitchen Appliances</a></li>
         
        </ul>
      </li>

      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Men
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Clothings</a></li>
          <li><a href="#">Foot Wears</a></li>
          <li><a href="#">men Groomings</a></li>
          <li><a href="#">Watches</a></li>
          <li><a href="#">Accessories</a></li>
   
          
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Women
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Clothing</a></li>
          <li><a href="#">Lingries and Sleepwears</a></li>
          <li><a href="#">Footwear</a></li>
          <li><a href="#">Beauty & Grooming</a></li>
          <li><a href="#">Accessories</a></li>
           <li><a href="#">Watches</a></li>
          
      
        </ul>
      </li>
 <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Sports Books & more
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Books</a></li>
          <li><a href="#">Stationaries</a></li>
          <li><a href="#">Sports</a></li>
          <li><a href="#">Exersice & Fitness</a></li>
          <li><a href="#">Game & Accessories</a></li>
           <li><a href="#">Watches</a></li>
          
     </ul>
      </li>

    </ul>
  </div>
</nav>
<%
      
           
%>           
            <%
                String username=(String)session.getAttribute("username");    
      
            out.print("<div style='height:80%; width:100%;  border: 3px solid red; background-color: powderblue;'>");
            out.print("<div style='height:20%; width:100%; border: 2px solid blue;  margin-top:2px; margin-left:2px; margin-right:2px;'>");
            out.print("<h1>Hello <b style='color:red;'> "+username+"</b></h1>");
            out.print("<b><h3 >Click <a href='index.html'>Logout</a> to logout</h3></b>");
            out.print("</div>");
            out.print("<div style='height:50%; width:50%; border: 2px solid blue; background-color: powderred; margin-top:2px; margin-left:25%; margin-right:25%; '>");
            out.print("<table class='table table-striped'>");
            out.print("<tr>"); 
            out.print("</tr>");
                try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection cn;
              cn=DriverManager.getConnection("jdbc:derby://localhost:1527/mycart;user=shashank;password=shasha4u");
              PreparedStatement pst;
              pst=cn.prepareStatement("select id, username, email, gender, dob, mob, city from signup where username='"+username+"'");
              ResultSet resultSet = null;
              resultSet = pst.executeQuery();
              if(resultSet.next())
              {
             
%>  
            <tr>
            <td><b>User ID   </b></td>
            <td><%=resultSet.getString("id") %></td>
            </tr>

             <tr>
            <td><b>Username   </b></td>
            <td><%=resultSet.getString("username") %></td>
             </tr>
             <tr>
            <td><b>Email      </b></td>
            <td><%=resultSet.getString("email") %></td>
             </tr>
             <tr>
            <td><b>Gender     </b></td>
            <td><%=resultSet.getString("gender") %></td>
             </tr>
              <tr>
            <td><b>DOB        </b></td>
            <td><%=resultSet.getString("dob") %></td>
            </tr
             <tr>
            <td><b>Mobile No.        </b></td>
            <td><%=resultSet.getString("mob") %></td>
            </tr>
            <tr>
            <td><b>City        </b></td>
            <td><%=resultSet.getString("city") %></td>
            </tr>
        </table>
        </div>
             <%
             session.removeAttribute("username");
            session.invalidate();
             %>
            
            
            <div style='height:10%; width:50%; border: 2px solid blue; background-color: powderblue; margin-top:2px; margin-left:25%; margin-right:25%; '>
             
                    <b><a href='#'style='font-size: 25px; padding-left: 40px; padding-top: 30px;'>My Order</a></b>
                    <b><a href='#' style='font-size: 25px; padding-left: 40px; padding-top: 30px;'>Wishlist</a></b>
                    <b><a href="edit.html" style="font-size: 25px; padding-left: 40px; padding-top: 30px;">Edit Profile</a></b>
                    <b><a href='delete.jsp' style='font-size: 25px; padding-left: 40px; padding-top: 30px;'>Delete Account</a></b>
       
           
    </div>
                   
            
            <%
         }
}
catch (Exception e) {
e.printStackTrace();
}
%>

           
    
    
<div id="abc1">
    <div id="popupContact2">
<div class="header">
		<h2>Contact us</h2>
	</div>
	
	<form method="post" action="#">
		<img id="close" src="images/7.png"  width="8%" height="8%" onclick ="div_hide2()">

		<div class="input-group">
			<label>Name</label>
			<input type="text" name="name"  id="name" placeholder="enter nane" required>
		</div>
		<div class="input-group">
			<label>Email</label>
			<input type="email" name="email"  id="email" placeholder="enter email" required>
		</div>
		<div class="input-group">
			<label>Message</label>
			<textarea id="msg" name="message" placeholder="Message" required=""></textarea>
		</div>


		<div class="input-group">
			<button type="submit" class="btn" name="submit">Send</button>
		</div>
		
	</form>
</div>
</div>



</body>
</html>

        
        
 



