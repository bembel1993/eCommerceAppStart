<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.connection.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <h4 class="header-line">Напишите сообщение</h4>
            </div>
            <div class="login-bottom">
                <%
                    String success = (String) session.getAttribute("success-message");
                    if (success != null) {
                        session.removeAttribute("success-message");
                %>
                <div class='alert alert-success' id='success' style="width: 680px;">Сообщение отправлено.
                </div>
                <%
                    }
                    String fail = (String) session.getAttribute("fail-message");
                    if (fail != null) {
                        session.removeAttribute("fail-message");
                %>
                <div class="alert alert-danger" id='danger' style="width: 680px;">Сообщение не отправлено
                </div>
                <%
                    }
                %>
                <form action="AddMessageAdmin" method="post">

                    <div class="sign-grds">
                        <input type="text" placeholder="Write here" required=""
                               style="min-height: 100px; width: 680px; color: black"
                               name="message_send">
                    </div>
                    <div class="sign-up">
                        <input type="submit" value="Send" style="width: 180px;">
                    </div>
                </form>
            </div>
        </div>
        <div class="login-bottom">
            <h3><font color="#4169e1">Чат</font></h3>
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
