<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 05.11.2020
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Form</title>
    <%@include file="bootstrap.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script>
        $(document).on("change", "#email",function(){
            $.ajax('CheckServlet', {
                type: 'POST',  // http method
                data: { email: $( "#email" ).val()},
                accepts: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data === 'true') {
                        $("#check").text("Account is not reserved");
                        $("#check").css({"color": "green"});
                    }else if (data === 'false') {
                        $("#check").text("Account is reserved");
                        $("#check").css({"color": "red"});
                    }

                },
                error: function (errorData, textStatus, errorMessage) {
                    var msg = (errorData.responseJSON != null) ? errorData.responseJSON.errorMessage : '';
                    $("#errormsg").text('Error: ' + msg + ', ' + errorData.status);

                    $("#errormsg").show();
                }

            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <header class="card-header">
                    <a href="login.jsp" class="float-right btn btn-outline-primary mt-1">Log in</a>
                    <h4 class="card-title mt-2">Sign up</h4>
                </header>
                <div id="errormsg" style="visibility: hidden"></div>
                <article class="card-body">
                    <form method="get" action="RegistrationServlet">
                        <div class="form-row">
                            <div class="col form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                            </div>
                            <div class="col form-group">
                                <label>Surname</label>
                                <input type="text" class="form-control" id="surname" name="surname" placeholder="Enter your surname">
                            </div>
                        </div>

                        <div class="form-group">
                            <span id="check"></span>
                            <label>Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                            <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" type="password" placeholder="Create your password" name="password">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>
                    </form>
                </article>
                <div class="border-top card-body text-center">Have an account? <a href="login.jsp">Log In</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
