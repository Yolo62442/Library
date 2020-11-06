<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="week8.Book" %>
<%@ page import="week8.User" %>
<%@ page import="week8.Borrower" %><%--
  Created by IntelliJ IDEA.
  User: tomirissayat
  Date: 06.11.2020
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book book = (Book)request.getAttribute("book");
    User currentUser = (User) session.getAttribute("user");
    List<Borrower> borrows = (List<Borrower>)request.getAttribute("borrows");
%>

<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Baloo+Bhai+2|Gotu|Pacifico&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,300,700" rel="stylesheet">
    <title>List</title>
    <script>
        $( document ).ready(function () {
            $('#deleteButton').click(function () {
                $.ajax({
                    url: 'book',
                    type: "POST",
                    data: {
                        action: "delete",
                        book: '<%=book%>'
                    }, accepts: "application/x-www-form-urlencoded; charset=UTF-8",
                    success: function (data) {
                        location.reload()
                    }
                });
            });

            $('#borrowButton').click(function () {
                $.ajax({
                    url: 'book',
                    type: "POST",
                    data: {
                        action: "borrow",
                        book: '<%=book%>'
                    }, accepts: "application/x-www-form-urlencoded; charset=UTF-8",
                    success: function (data) {
                        location.reload()
                    }
                });
            });
        });
    </script>
</head>
<body>
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
                        <th>Actions</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                    <%
                        List<Book> books = (ArrayList<Book>)request.getAttribute("books");
                        for (Book bookis: books) {
                            if (bookis.getCount() == 0 ) continue;
                    %>
                    <tr>
                        <td><%=bookis.getId()%></td>
                        <td><a href="<%=bookis.getName()%>"><%=bookis.getName()%></a></td>
                        <td><%=bookis.getAuthor()%></td>
                        <td><%=bookis.getCount()%></td>
                        <td>
                            <button type="button" id="borrowButton" style="background-color: darkred; color: white; border: 1px solid transparent;
                                        border-radius: .25rem; padding: .7rem 1rem; line-height: 1.3rem; float: left; margin-top: 20px">Borrow</button>
                            <%
                                if (currentUser.getAccess() == 1) {
                            %>
                            <button type="button" id="deleteButton" style="background-color: darkred; color: white; border: 1px solid transparent;
                                        border-radius: .25rem; padding: .7rem 1rem; line-height: 1.3rem; float: left; margin-top: 20px">Delete</button>
                        <%
                            }
                        %>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>

            </div>
        </section>
    </div>
    <%
        if (currentUser.getAccess() == 1) {
    %>
    <form action="addBook.jsp" >
        <button type="submit" style="background-color: darkred; color: white; border: 1px solid transparent;
        border-radius: .25rem; padding: .7rem 1rem; line-height: 1.3rem; float: left; margin-top: 20px">Add book</button>
    </form>
    <%
        }
    %>

</body>
</html>

