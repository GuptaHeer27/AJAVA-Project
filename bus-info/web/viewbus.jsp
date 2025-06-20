
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
       
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bus</title>
    </head>
    <body>
        
         <%
    try{
     Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo", "root", "maheer2709");

                String Source = request.getParameter("src");
                String Destination = request.getParameter("des");
                String datestr = request.getParameter("date");
                LocalDate date = LocalDate.parse(datestr);
                String Day = date.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);

              
            
                Statement st = con.createStatement();
               
String query = "SELECT * FROM bus_info WHERE source='"+Source+"' AND destination='"+Destination+"' AND day='"+Day+"'"; 
ResultSet rs = st.executeQuery(query);
   
%>


        <tabel border="1" >
        <tr>
            <th>Source</th> 
            <th>Destination</th>
            <th>Day</th>
            <th>Time</th>
        </tr>
       
        <% 
         System.out.println("hii");
        while(rs.next())
        {
        %>
        <tr>
        <td><%=rs.getString("source")%></td>
        <td><%=rs.getString("destination")%></td>
        <td><%=rs.getString("day")%></td>
        <td><%=rs.getTime("time")%></td>
        </tr>
    
    <%
         } 
        rs.close();
        st.close();
        con.close();  
     }catch(Exception e){
             e.printStackTrace();
    }
    %>
    
    </tabel>
    
    </body>
</html>




