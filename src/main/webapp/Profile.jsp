<%@ page import="week8.User" %>
<%@ page import="week8.Borrower" %>
<%@ page import="java.util.List" %>
<%@ page import="week8.Book" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Zhansaya
  Date: 07.11.2020
  Time: 00:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currentUser = (User) session.getAttribute("user");
    List<Book> borrow = (List<Book>)request.getAttribute("borrow");
%>
<html>
<head>
    <title>Profile</title>
</head>
<style>
    h1{
        font-size: 30px;
        color: #fff;
        text-transform: uppercase;
        font-weight: 300;
        text-align: center;
        margin-bottom: 15px;
    }
    table{
        width:100%;
        table-layout: fixed;
    }
    .tbl-header{
        background-color: rgba(255,255,255,0.3);
    }
    .tbl-content{
        height:300px;
        overflow-x:auto;
        margin-top: 0px;
        border: 1px solid rgba(255,255,255,0.3);
    }
    th{
        padding: 20px 15px;
        text-align: left;
        font-weight: 500;
        font-size: 25px;
        color: #fff;
        text-transform: uppercase;
    }
    td{
        padding: 35px;
        text-align: left;
        vertical-align:middle;
        font-weight: 300;
        font-size: 20px;
        color: #fff;
        border-bottom: solid 1px rgba(255,255,255,0.1);
    }


    /* demo styles */

    @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
    body{
        background: -webkit-linear-gradient(left, #25c481, #25b7c4);
        background: linear-gradient(to right, #25c481, #25b7c4);
        font-family: 'Roboto', sans-serif;
    }
    section{
        margin: 50px;
    }


    ::-webkit-scrollbar {
        width: 6px;
    }
    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    }
    ::-webkit-scrollbar-thumb {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    }
    .overlay h1 {
        text-align:center;
        color:#fff;
        font-size: 70px;
        margin-top:17%;
    }

    body {
        background-repeat: no-repeat;
        background-size: cover;
    }

</style>
<body>






<div>
    <h1><%=currentUser.getName()%></h1>
    <h1><%=currentUser.getSurname()%></h1>
    <h1><%=currentUser.getEmail()%></h1>
    <h1>Borrowed books</h1>
</div>
<div class="list-group">

    <section>

        <div class="tbl-header" style="margin-top: 40px">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name Of the Book</th>
                    <th>Author</th>
                    <th>Number of remaining books</th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                <%
                    for (Book bookis: borrow) {
                %>
                <tr>
                    <td><%=bookis.getId()%></td>
                    <td><%=bookis.getName()%></td>
                    <td><%=bookis.getAuthor()%></td>
                    <td><%=bookis.getCount()%></td>
                    <td>

                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>

        </div>
        <div>
        <form action="BookServlet">
        <button type="submit" style="background-color: darkred; color: white; border: 1px solid transparent;
                                        border-radius: .25rem; padding: .7rem 1rem; line-height: 1.3rem; float: left; margin-top: 20px" >Main</button>
    </form>
        </div>
         <div style="float: right">
        <form action="login.jsp">
            <button type="submit" style="background-color: darkred; color: white; border: 1px solid transparent;
                                        border-radius: .25rem; padding: .7rem 1rem; line-height: 1.3rem; float: left; margin-top: 20px" >Log out</button>
        </form>
         </div>
</section>
</div>
</body>
</html>
