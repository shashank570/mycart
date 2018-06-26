import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class validate extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
           
            String username=request.getParameter("username");
            String password=request.getParameter("password");
        try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection cn;
              cn=DriverManager.getConnection("jdbc:derby://localhost:1527/mycart;user=shashank;password=shasha4u");
                    PreparedStatement pst;
                    pst=cn.prepareStatement("select * from signup where username='"+username+"' and password='"+password+"'");
                    ResultSet rs;
                    rs=pst.executeQuery();
                    if(rs.next())
                    {
                        
             HttpSession session=request.getSession(true);
            session.setAttribute("username", username);
            
                 RequestDispatcher rd=request.getRequestDispatcher("MyAccount.jsp");
                rd.forward(request, response);
                    }
                    else
                    {
                        RequestDispatcher rd=request.getRequestDispatcher("error.html");
                rd.forward(request, response);
                
            
                    }
                }
                catch(Exception ex){}
            }
        }
    }

