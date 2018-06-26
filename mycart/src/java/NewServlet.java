import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
public class NewServlet extends HttpServlet {

   
    
    
    
    
      String  email,username,password,password_repeat,gen,dob ,mob,city;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
       try{
            
          
            email=request.getParameter("email");
            username=request.getParameter("username");
            password=request.getParameter("password");
            password_repeat=request.getParameter("password_repeat");
            gen=request.getParameter("gen");
            dob=request.getParameter("dob");
            mob=request.getParameter("mob");
            city=request.getParameter("city");
            
              Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection cn;
              cn=DriverManager.getConnection("jdbc:derby://localhost:1527/mycart;user=shashank;password=shasha4u");
              PreparedStatement pst;
              Random r=new Random();
              int id=r.nextInt(10000);
              pst=cn.prepareStatement("insert into signup values("+id+",'"+email+"','"+username+"','"+password+"','"+gen+"','"+dob+"','"+mob+"','"+city+"')");
              int xx=pst.executeUpdate();
              if(xx==1)
              {
                  HttpSession session=request.getSession(true);
                  session.setAttribute("username", username);
                  RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                  rd.include(request,response);
              }
           
        } catch(Exception ex)
                      {
                      System.out.println(ex);
                      }
        }
    }
