<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="assets/css/Header-Picture.css">
</head>
<body>
<%
    //Checking whether admin in session or not
    if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Заказы</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">Все заказы</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr align="center" bgcolor="black">
                                    <th>#</th>
                                    <th>№</th>
                                    <th>Данные о клиенте</th>
                                    <th>Товар</th>
                                    <th>Количество</th>
                                    <th>Полная стоимость</th>
                                    <th>Статус</th>
                                    <th>Время заказа</th>
                                    <th>Способ оплаты</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <%
                                    ResultSet resultOrders = DatabaseConnection.getResultFromSqlQuery("select * from tblorders");
                                    while (resultOrders.next()) {
                                %>
                                <tbody>
                                <tr>
                                    <td>
                                        <h4><font color="black">
                                            <%=resultOrders.getInt(1)%>
                                        </font></h4>
                                    </td>
                                    <td>
                                        <h4><font color="black">
                                            <%=resultOrders.getInt(2)%>
                                        </font></h4>
                                    </td>
                                    <td><h4><font color="black"><b>
                                        <%=resultOrders.getString(3)%>|
                                        <%=resultOrders.getString(4)%>|
                                        <%=resultOrders.getString(5)%>|
                                        <%=resultOrders.getString(6)%>|
                                        <%=resultOrders.getString(7)%>|
                                    </b></font></h4>
                                    </td>
                                    <td><h4><font color="black"><%=resultOrders.getString(9)%>
                                    </font></td>
                                    <td><h4><font color="black">
                                        <%=resultOrders.getString(10)%>
                                    </font></h4>
                                    </td>
                                    <td><h4><font color="black">
                                        <%=resultOrders.getString(13)%>
                                    </font></h4></td>
                                    <%
                                        if (resultOrders.getString(14).equals("Deliver")) {
                                    %>
                                    <td><span class="label label-success">Delivered</span></td>
                                    <%
                                    } else {
                                    %>
                                    <td><span class="label label-danger">Pending</span></td>
                                    <%
                                        }
                                    %>
                                    <td><h4><font color="black">
                                        <%=resultOrders.getString(15)%>
                                    </font></h4>
                                    </td>
                                    <td><h4><font color="black">
                                        <%=resultOrders.getString(16)%>
                                    </font></h4>
                                    </td>
                                    <%
                                        if (resultOrders.getString(14).equals("Deliver")) {
                                    %>
                                    <td><a href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>">
                                        <button class="btn btn-danger"
                                                onClick="return confirm('Are you sure, You want to change product delivery status');">
                                            Pending
                                        </button>
                                    </a></td>
                                    <%
                                    } else {
                                    %>
                                    <td><a
                                            href="CustomerProductsOrderStatus?orderId=<%=resultOrders.getInt(2)%>">
                                        <button class="btn btn-primary"
                                                onClick="return confirm('Are you sure, You want to change product delivery status?');">
                                            Deliver
                                        </button>
                                    </a></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
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
