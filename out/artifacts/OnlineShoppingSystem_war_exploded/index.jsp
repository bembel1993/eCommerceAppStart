<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="assets/css/style.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all"/>
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
                            <span class="sr-only"><font color="#4169e1">Toggle navigation</font></span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
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
                        //Getting all cart details of the customer
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
<div class="banner-grid">
    <div id="visual">
        <div class="slide-visual">
            <ul class="slide-group">
                <li><img class="img-responsive" src="assets/img/5.jpg" alt="Dummy Image"/></li>
                <li><img class="img-responsive" src="assets/img/4.jpg" alt="Dummy Image"/></li>
                <li><img class="img-responsive" src="assets/img/6.jpg" alt="Dummy Image"/></li>
                <li><img class="img-responsive" src="assets/img/7.jpg" alt="Dummy Image"/></li>
            </ul>
            <div class="script-wrap">
                <!-- <ul class="script-group">
                     <li>
                         <div class="inner-script">
                             <img class="img-responsive" src="assets/img/s22.png" alt="Dummy Image"/>
                         </div>
                     </li>
                     <li>
                         <div class="inner-script">
                             <img class="img-responsive" src="assets/img/asus.png" alt="Dummy Image"/>
                         </div>
                     </li>
                     <li>
                         <div class="inner-script">
                             <img class="img-responsive" src="assets/img/apple.png" alt="Dummy Image"/>
                         </div>
                     </li>
                 </ul>-->
                <div class="slide-controller">
                    <a href="#" class="btn-prev"><p><span class="glyphicon glyphicon-circle-arrow-left fa-2x"
                                                          alt="Prev Slide"></span></p></a>
                    <a href="#" class="btn-play"><p><span class="glyphicon glyphicon-play-circle fa-2x"
                                                          alt="Start Slide"></span></p></a>
                    <a href="#" class="btn-pause"><p><span class="glyphicon glyphicon-pause fa-2x"
                                                           alt="Pause Slide"></span></p></a>
                    <a href="#" class="btn-next"><p><span class="glyphicon glyphicon-circle-arrow-right fa-2x"
                                                          alt="Next Slide"></span></p></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <script type="text/javascript" src="js/pignose.layerslider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#visual').pignoseLayerSlider({
                play: '.btn-play',
                pause: '.btn-pause',
                next: '.btn-next',
                prev: '.btn-prev'
            });
        });
    </script>
</div>
<br/>

<div class="product-easy">
    <div class="container">
        <div class="container">
            <h2>
                <span><center><font color="black">Наши товары</font></center></span>
            </h2>
        </div>

        <form action="AddToCart" method="post">
            <table class="table table-bordered">
                <thead>
                <tr align="center" bgcolor="black">
                    <th scope="col">Название</th>
                    <th scope="col">Категория</th>
                    <th scope="col">Цена</th>
                </tr>
                </thead>
                <%
                    ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                    while (retriveProduct.next()) {
                %>
                <tbody>
                <!--   for (Todo todo: todos) {  -->
                <tr>
                    <td><h4>
                        <font color="black">
                            <img width="30%" height="30%" src="<%=retriveProduct.getString("product_img_source")%>"alt="product_image" /></a>
                            <b>
                                <%=retriveProduct.getString("name")%>
                            </b>
                        </font>
                    </h4>
                    </td>
                    <td><h4><font color="black"><%=retriveProduct.getString("product_category")%>
                    </font></h4>
                    </td>
                    <td><h5><font color="black"><%=retriveProduct.getString("price")%>
                    </font></h5>$.
                    </td>
                    <!--     <td>
                             <input type="submit" value="Add to cart" class="btn btn-warning"
                                    onclick="return confirm('Are you sure Do you want to add this item in cart?');">
                         </td>-->
                </tr>
                <!-- } -->
                </tbody>
                <%
                    }
                %>
            </table>
        </form>
    </div>
</div>
<jsp:include page="footer2.jsp"></jsp:include>
</body>
</html>