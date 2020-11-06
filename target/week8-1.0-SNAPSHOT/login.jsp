<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 05.11.2020
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorization Form</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <header class="card-header">
                    <h4 class="card-title mt-2">Log in</h4>
                </header>
                <article class="card-body">
                    <form method="GET" action="LoginServlet">

                        <%
                            String err = (String) request.getAttribute("Error");
                            if (err != null) {
                        %>
                            <div class="form-group"><h4 style="color: red"><%=err%></h4></div>
                        <%
                            }
                        %>

                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                            <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>



                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" type="password" placeholder="Create your password" name="password">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </div>
                    </form>
                </article>
                <div class="border-top card-body text-center">Don't have account? <a href="index.jsp">Registration</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>