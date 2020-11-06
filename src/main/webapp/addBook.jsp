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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <title>Add Book</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
<style>
    body {
        background-image: url("https://s53.radikal.ru/i141/1103/26/5625ab6b3fe1.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
<div class="container container-login" style = "margin-top: 10px; color: #fff;">
    <div class="col-md-8" style="margin-left: 150px">
    <form method="post" action="AddBookServlet">
        <h3 style="background-color: rgba(255, 61, 61, 0.568); height: 50px; text-align: center; padding: 5px"><b>Add New Book</b></h3>
        <div class="form-group">
            <input type="hidden" value="add" name="action" style="background-color: rgba(14, 56, 156, 0.329); border: 0px; color: white;">
            <label style="background-color: rgba(14, 56, 156, 0.329); border: 0px; color: white;" for="exampleInputEmail2">Name: <input type="text" name="name" class="form-control" id="exampleInputEmail2"></label><br>
            <label style="background-color: rgba(14, 56, 156, 0.329); border: 0px; color: white;" for="exampleFormControlTextarea1">Author: <textarea name="author" class="form-control" id="exampleFormControlTextarea1"></textarea></label><br>
            <label style="background-color: rgba(14, 56, 156, 0.329); border: 0px; color: white;">Count:<br> <input type="number" name="count" class="form-group"></label><br>
        </div>
        <input type="submit" class="btn btn-primary" value="Save">
    </form>
    </div>
</div>
</body>
</html>
