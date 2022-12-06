<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping System</title>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                <h4 class="header-line">Добавить товар</h4>
            </div>
        </div>
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
                session.removeAttribute("message");
        %>
        <div class="alert alert-success" id="success">Товар добавлен успешно.</div>
        <%
            }
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading">Заполните поля ниже</div>
                    <div class="panel-body">
                        <form action="AddProducts" method="post">
                            <div class="form-group">
                                <label>Введите название</label> <input class="form-control" type="text" name="nameprod"
                                                                 required/>
                            </div>
                            <div class="form-group">
                                <label>Введите код</label> <input class="form-control" type="text" name="code"
                                                                 required/>
                            </div>
                            <div class="form-group">
                                <label>Цена</label> <input class="form-control" type="number" name="price" required/>
                            </div>
                            <div class="form-group">
                                <label>Описание</label> <input class="form-control" type="text"
                                                                  style="min-height: 100px;" name="description"
                                                                  required/>
                            </div>
                            <div class="form-group">
                                <label>Статус</label>
                                <select class="form-control" name="status" required>
                                    <option>Active</option>
                                    <option>In-Active</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Категория товара</label>
                                <select class="form-control" name="product_category" required>
                                    <option>Smartphone</option>
                                    <option>Laptop</option>
                                    <option>Console</option>
                                    <option>Acoustic system</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Источник изображения товара</label>
                                <input class="form-control" type="text" name="product_img_source" required/>
                            </div>
                            <button type="submit" class="btn btn-success"
                                    onclick="return confirm('Вы действительно хотите добавить этот товар?');">Add
                                Product
                            </button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
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