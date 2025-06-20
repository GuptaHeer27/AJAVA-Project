<%-- 
    Document   : bookticket
    Created on : 19-Jun-2025, 2:33:48 pm
    Author     : heerd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="viewbus.jsp" method="Post">
            Source:<input type="text" name="src"><br>
            Destination:<input type="text" name="des"><br>
            Date:<input type="date" name="date"><br>
            <button>View</button>
        </form>
    </body>
</html>
