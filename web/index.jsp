<%-- 
    Document   : index
    Created on : Jan 4, 2013, 5:06:27 PM
    Author     : andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, java.sql.*, com.homecredit.studyproject.SqlQuery"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%
        String title = null;
        String text = null;
        SqlQuery sqText = new SqlQuery();
        ResultSet rsText = sqText.executeStatement("SELECT * FROM posted_text WHERE name = 'first page'");            
        ResultSetMetaData rsmText = rsText.getMetaData();            
        int j = 0;
        while (rsText.next()) {
            title = rsText.getString("name");
            text = rsText.getString("text");
        }
        sqText.closeConnection();     
 %>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/confluence/css/indexstyle.css" type="text/css">
        <script type="text/javascript">
            <c:import url="/javascript/tree.js" />
        </script>
    </head>
    
    <body>
        <div class="outerdiv">
        <%@include file="/jspf/header.jspf"%> 
        <div class="choisediv" id="choisediv">
            <ul class="Container">
                <li class="Node IsRoot ExpandOpen">
        	    <div class="Expand"></div>
                    <div class="Content">Root</div>
                    <ul class="Container">
                        <li class="Node ExpandLeaf">
                            <div class="Expand"></div>
                            <div class="Content">Item 1</div>
                 	</li>
        	    </ul>
       	        </li>
            </ul>
        </div>
        <div class="documentdiv" id="documentdiv">
            <form action="/historyscroll/fileDealer" enctype="multipart/form-data" method="post"> 
                <p class="readtitle"><%=title%></p>
                <p class="readtext"><%=text%></p>
                <input id="readedit" class="readbutton" type="submit" value="Edit"/>
                <input id="readnew" class="readbutton" type="submit" value="New"/>
            </form>
        </div>               
        <%@include file="/jspf/footer.jspf"%>
        </div>
    </body>
</html>
