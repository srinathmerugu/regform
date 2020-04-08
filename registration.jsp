
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <%
           try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/mydb","root","");
            //Statement stmt=((PreparedStatement))con.createStatement();
            if(con!=null){
                
                    out.print("<h1>connected<br>");
                    
                    String uname=request.getParameter("uname");
                    String pwd= request.getParameter("pwd");
                    String pwd1=request.getParameter("pwd1");
                    String gender=request.getParameter("gender");
                    String email=request.getParameter("mailid");
                    String pcode=request.getParameter("phoneCode");
                    String phone=request.getParameter("phone");
                    int i=Integer.parseInt(pcode);
                    int k=Integer.parseInt(phone);
                    
                    //out.print(uname);
                    //out.print(pwd1+"<br>");
 PreparedStatement ps = con.prepareStatement
        ("INSERT INTO registration (username, password, repeat_password, gender, email, phoneCode, phone) VALUES (?, ?, ?, ?, ?, ?, ?)");
 
                    
                    ps.setString(1, uname);
                    ps.setString(2, pwd);
                    ps.setString(3, pwd1);
                    ps.setString(4, gender);
                    ps.setString(5, email);
                    ps.setInt(6,i);
                    ps.setInt(7,k);
                    
                    boolean b=ps.execute();
                    
                    if(b== false ){
                    out.print("WELCOME" +uname);
                    System.out.print("yes inserted");
                    return;
        }
                    con.close();
           
           }
           }
        catch(Exception e)
        {
        out.print("Exception"+e);
        } 


            %>
             
            <a href="lol.html"></a>
    </body>
</html>
