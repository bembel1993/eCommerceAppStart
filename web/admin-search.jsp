<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="js/jquery.easing.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="assets/css/Header-Picture.css">

</head>
<body>
<%
    //Checking whether admin in session or not
    if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">РЕЗУЛЬТАТ ПОИСКА</h4>
            </div>
        </div>
    </div>
</div>

<div id="mainBody">
    <div class="container">
        <div class="row">

            <h4>"<c:out value="${param.text }"></c:out>" </h4>
            <h4>
                <font color="#32cd32">
                    <c:out value=" ${requestScope.success }">
                    </c:out>
                </font>
            </h4>
            <h4>
                <font color="red">
                    <c:out value=" ${requestScope.error }">
                    </c:out>
                </font>
            </h4>
            <form action="AddToCart" method="post">
                <ul class="thumbnails">
                    <c:forEach var="i" items="${products}">
                        <li class="span3">
                            <div class="thumbnail">
                                <div class="caption">
                                    <a href="InformationProductController?id=${i.id}">
                                        <img width="30%" height="30%" src="${i.src}"alt="product_image" /></a>
                                    <h4 style="text-align: center">
                                        <b>
                                            <font color="black">
                                                <c:out value="${i.name}"/>
                                            </font>
                                        </b>
                                    </h4>
                                    <br>
                                    <h5 style="text-align: center">
                                        <c:out value="${i.description }"/>
                                    </h5>
                                    <br>
                                    <h5 style="text-align: center">
                                        <font color="#4169e1">
                                            <c:out value="${i.active }"/>
                                        </font>
                                        <br>
                                    </h5>
                                    <br>
                                    <h5 style="text-align: center">
                                        <font color="#daa520">
                                            <b>
                                                $<c:out value="${i.price }"/>
                                            </b>
                                        </font>
                                    </h5>
                                </div>
                                <input type="submit" value="Add to cart" class="btn btn-warning"
                                       onclick="return confirm('Вы действительно хотите добавить этот товар в корзину?');">

                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </form>
        </div>
    </div>
</div>


<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/custom.js"></script>
<%
    } else {
        response.sendRedirect("admin-login.jsp");
    }
%>
</body>
</html>
