<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
    <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>

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
                    <a href="javascript:;" class="simpleCart_empty">Моя корзина</a>
                </p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="page-head">
    <div class="container">
        <h3><font color="#4169e1">Результат поиска:</font></h3>
    </div>
</div>

<div id="mainBody">
    <div class="container">
        <div class="row">

            <h4><font color="black">"<c:out value="${param.text }"></c:out>"
            </font></h4>
            <div class="alert alert-success">
                <h4>
                    <font color="#32cd32">
                        <c:out value=" ${requestScope.success }">
                        </c:out>
                    </font>
                </h4>
            </div>
            <div class="alert alert-danger">
                <h4>
                    <font color="red">
                        <c:out value=" ${requestScope.error }">
                        </c:out>
                    </font>
                </h4>
            </div>
            <form action="AddToCart" method="post">
                <ul class="thumbnails">
                    <c:forEach var="i" items="${products}">
                        <li class="span3">
                            <div class="thumbnail">
                                <div class="caption">
                                    <a href="InformationProductController?id=${i.id}">
                                        <img width="30%" height="30%" src="${i.src}" alt="product_image"/></a>
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
                              <!--  <a href="${pageContext.request.contextPath }/AddToCart?action=add&id=${i.id}">Add</a>-->
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

<div class="electronics">
    <div class="container">
        <div class="clearfix"></div>
        <div class="ele-bottom-grid">
            <h3>
                Наши товары
            </h3>
            <%
                ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                while (retriveProduct.next()) {
            %>
            <form action="AddToCart" method="post">
                <div class="col-md-3 product-men">
                    <div class="men-pro-item simpleCart_shelfItem">
                        <div class="men-thumb-item">
                            <input type="hidden" name="productId" value="<%=retriveProduct.getInt("id")%>">
                        </div>
                        <div class="item-info-product ">
                            <img width="30%" height="30%" src="<%=retriveProduct.getString("product_img_source")%>"
                                 alt="product_image"/></a>
                            <h4>
                                <%=retriveProduct.getString("name")%>
                            </h4>
                            <h5>
                                Категория: <%=retriveProduct.getString("product_category")%>
                            </h5>
                            <div class="info-product-price">
                                <input type="hidden" name="price" value="<%=retriveProduct.getString("price")%>">
                                <span class="item_price"><%=retriveProduct.getString("price")%> $.</span>

                            </div>
                            <input type="submit" value="Add to cart" class="btn btn-warning"
                                   onclick="return confirm('Вы действительно хотите добавить этот товар в корзину?');">
                        </div>
                    </div>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
</div>

<jsp:include page="footer2.jsp"></jsp:include>
</body>
</html>
