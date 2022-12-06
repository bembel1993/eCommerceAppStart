<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="assets/css/style.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
          rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="js/jquery.easing.min.js"></script>

    <style>
        body {
            background-color: mintcream;
        }
    </style>
</head>
<body>
    <%
            //Checking whether customer in session or not
            if (session.getAttribute("name") != null && session.getAttribute("name") != "") {
        %>
<body>
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                    </div>
                    <jsp:include page="header.jsp"></jsp:include>
                </div>
            </nav>
        </div>
        <div class="top_nav_right">
            <div class="cart box_1">
                <a href="checkout.jsp">
                    <%
                        ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
                        resultCount.next();
                        int count = resultCount.getInt(1);
                    %>
                    <h3>
                        <div class="total">
                            <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                            (
                            <%=count%>
                            объект(-ы) )
                        </div>
                    </h3>
                </a>
                <p>
                    <a href="javascript:;" class="simpleCart_empty">Корзина пуста</a>
                </p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<br>
<div class="modal-dialog" role="document">
    <div class="modal-content modal-info">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body modal-spa">
            <div class="login-grids">
                <div class="login">
                    <div class="login-bottom">
                        <h3><font color="#4169e1">Написать сообщение</font></h3>
                        <%
                            String success = (String) session.getAttribute("success-message");
                            if (success != null) {
                                session.removeAttribute("success-message");
                        %>
                        <div class='alert alert-success' id='success' style="width: 680px;">Сообщение отправлено
                            успешно.
                        </div>
                        <%
                            }
                            String fail = (String) session.getAttribute("fail-message");
                            if (fail != null) {
                                session.removeAttribute("fail-message");
                        %>
                        <div class="alert alert-danger" id='danger' style="width: 680px;">Сообщение не отправлено,
                            попытайтесь сново
                        </div>
                        <%
                            }
                        %>
                        <form action="AddMessage" method="post">

                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="Write here" required=""
                                       style="min-height: 100px; width: 680px; color: black" name="message_send">
                            </div>
                            <div class="sign-up">
                                <input type="submit" value="Send" style="width: 180px;">
                            </div>
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <div class="col-md-3 coupons-gd">
            <span class="glyphicon glyphicon-send" aria-hidden="true"></span>
            <h4><font color="#4169e1">Чат</font></h4>
        </div>
    </div>

<div class="container">
    <div class="container">
        <h2>
            <!--            <span><center>div</center></span>-->
        </h2>
    </div>
    <%
        ResultSet retriveMessage = DatabaseConnection.getResultFromSqlQuery("select * from tblmessage order by id desc");
        while (retriveMessage.next()) {
    %>
    <div class="alert alert-success" >
        <h4>
            <%=retriveMessage.getString("message_send")%>
            <br>
            <%=retriveMessage.getString("message_date")%>
        </h4>
        <h6>
            <b><%=retriveMessage.getString("name")%>
            </b>
        </h6>
        </br>
    </div>
    <%
        }
    %>
    <br><br><br>
</div>
<jsp:include page="footer2.jsp"></jsp:include>
<%
    } else {
        response.sendRedirect("my-chat.jsp");
    }
%>
</body>
</html>
