<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>
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
                <h4 class="header-line">Товары</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">Все товары</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr align="center" bgcolor="black">
                                    <th>#</th>
                                    <th>Изображение</th>
                                    <th>Название</th>
                                    <th>Описание</th>
                                    <th>Цена ($)</th>
                                    <th>Дата</th>
                                    <th>Статус</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <%
                                    ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                                    while (rs.next()) {
                                %>
                                <tbody>
                                <tr>
                                    <td><%=rs.getInt("id")%>
                                    </td>
                                    <td><h4><font color="black">
                                        <img width="50%" height="50%" src="<%=rs.getString("product_img_source")%>"alt="product_image" /></a>
                                    </font></h4>
                                    </td>
                                    <td><h4><font color="black"><b><%=rs.getString("name")%>
                                    </font></h4>
                                    </td>

                                    <td><h5><font color="black"><%=rs.getString("description")%>
                                    </font></h5>
                                    </td>

                                    <td><h5><font color="black"><%=rs.getString("price")%>
                                    </font></h5>
                                    </td>
                                    <td><h5><font color="black"><%=rs.getString("create_date")%>
                                    </font></h5>
                                    </td>
                                    <td><h5><font color="black"><%=rs.getString("active")%>
                                    </font></h5>
                                    </td>
                                    <td><a
                                            href="admin-edit-product.jsp?id=<%=rs.getInt("id")%>"
                                            class="btn btn-primary">Изменить</a>|<a
                                            href="admin-delete-product.jsp?id=<%=rs.getInt("id")%>"
                                            class="btn btn-danger"
                                            onclick="return confirm('Удалить продукт?');">Удалить</a>
                                    </td>
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
<jsp:include page="footer.jsp"></jsp:include>
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