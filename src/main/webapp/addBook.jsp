<%--
  Created by IntelliJ IDEA.
  User: tomirissayat
  Date: 07.11.2020
  Time: 00:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
    <form method="post" action="AddBookServlet">
        <div class="form-group">
            <input type="hidden" value="add" name="action">
            <label for="exampleInputEmail2">Name: <input type="text" name="name" class="form-control" id="exampleInputEmail2"></label><br>
            <label for="exampleFormControlTextarea1">Author: <textarea name="author" class="form-control" id="exampleFormControlTextarea1"></textarea></label><br>
            <label>Count:<br> <input type="number" name="count" class="form-group"></label><br>
        </div>
        <input type="submit" class="btn btn-primary" value="Save">
    </form>
</body>
</html>
