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


<!-- Authorization -->
<div class="modal-body modal-spa">
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <form action="CustomerLogin" method="post" id="login-form">

                            <h2><strong><font color="black">Авторизация</font></strong></h2><br>
                            <%
                                String credential = (String) session.getAttribute("credential");
                                if (credential != null) {
                                    session.removeAttribute("credential");
                            %>
                            <div class="alert alert-danger" id="danger" style="width: 360px;">Вы неправильно ввели реквизиты
                                для входа.
                            </div>
                            <%
                                }
                            %>

                            <div class="form-floating mb-3">
                                <input type="text" name="email" class="form-control" id="logininput"
                                       placeholder="Login">
                                <label for="logininput">Электронная почта</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" name="password" class="form-control" id="passinput"
                                       placeholder="Password">
                                <label for="passinput">Пароль</label>
                            </div>
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-4">
                                    <button type="submit" class="btn btn-success">Вход</button>
                                </div>
                                <div class="col-4"><a class="btn btn-outline-success" href="customer-register.jsp"
                                                      role="button">Регистрация</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="footer2.jsp"></jsp:include>
</body>
</html>