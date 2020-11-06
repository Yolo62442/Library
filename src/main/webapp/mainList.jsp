<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tomirissayat
  Date: 06.11.2020
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<style>
    body {
        background-image: url("https://ru.freepik.com/free-vector/watercolor-autumn-leaves-background_5335075.htm");
        background-repeat: no-repeat;
        background-size: cover;
    }

    .fancy-btn {
        display:inline-block;
        position:relative;
        padding:10px 20px;
        border:2px solid white;
        color:white;
        font-family: 'Roboto', sans-serif;
        font-style:italic;
        font-size:30px;
        text-decoration:none;
        margin:20px auto;
        opacity:1;
        transition: color 0.4s
    }
    .fancy-btn:after{
        content:" ";
        border:2px solid rgba(0,0,0,0);
        display:inline-block;
        width:100%;
        height:100%;
        position:absolute;
        top:0;
        left:0;
        right:0;
        bottom:0;
        margin:auto;
        transition:all 0.4s;
    }
    .fancy-btn:hover{
        color:#eee
    }
    .fancy-btn:hover:after{
        border:2px solid #fda;
        width: calc(100% - 10px);
        height: calc(100% + 10px);
    }
    #btn-twtr{
        clear:both;
        color:rgb(255, 255, 255);
        border:2px solid;
        border-radius:3px;
        text-align:center;
        text-decoration:none;
        display:block;
        font-family: 'Roboto', sans-serif;
        font-size:14px;
        width:13em;
        padding:5px 10px;
        font-weight:600;
        margin:90px auto;
        background:rgba(0,0,0,0.2);
        box-shadow:0 0 0px 3px rgba(0,0,0,0.2);
        opacity:0.6
    }#btn-twtr:hover{color:#fff;opacity:1}
</style>
<div class="book">
    <h1>Book List:</h1>
    <ol class="list-group">
        <%
            User user = (User)request.getSession().getAttribute("user");
            List<Book> books = (ArrayList<Book>)request.getAttribute("books");
            for (Book book: books) {
                if (book.getCount() <= 0 && user.getAccess() < 2) continue;
        %>
        <li class="list-group-item d-flex justify-content-between align-items-center"> <a href="book?isbn=<%=book.getId()%>"> <%= book.getName() %></a> <span class="badge badge-primary badge-pill"><%=book.getCount()%></span></li><hr>
        <%
            }
        %>
    </ol>
</div>
</body>
</html>

