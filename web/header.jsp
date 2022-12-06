<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Defining Header for the user/customer -->

<style>
    #logo {
        width: 40px;
        height: 58px;
    }

    .text {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 24px;
        color: goldenrod;
        font-weight: bold;
        margin-left: -120px;
        padding-top: 5px;
        width: 30px;
    }

    .text1 {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 18px;
        color: royalblue;
        font-weight: bold;
        margin-left: 5px;
        width: 30px;
        margin-top: -23px;
    }
</style>
<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">

    <ul class="nav navbar-nav menu__list">
        <li><a href="index.jsp">
            <div id="logo">
                <div class="text">Computer</div>
                <div class="text1">Store</div>
            </div>
        </a>
        </li>
        <li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">Главная <span
                class="sr-only">(current)</span></a></li>
        <li class=" menu__item"><a class="menu__link" href="products.jsp">Товары</a></li>
        <%
            if ((String) session.getAttribute("name") != null) {
        %>
        <li class="menu__item"><a class="menu__link" href="my-orders.jsp">Мои заказы</a></li>
        <li class="menu__item"><a class="menu__link" href="my-chat.jsp">Сообщения</a></li>
        <li class="menu__item"><a class="menu__link" href="logout.jsp">Выход</a></li>
        <%
        } else {
        %>
        <li class="menu__item"><a class="menu__link" href="customer-login.jsp">Вход для клиента</a></li>
        <li class="menu__item"><a class="menu__link" href="customer-register.jsp">Регистрация</a></li>
        <li class="menu__item"><a class="menu__link" href="admin-login.jsp">Вход для админа</a></li>
        <%
            }
        %>
    </ul>
</div>
<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav menu__list">
        <li class="menu__item">
            <form class="form-inline navbar-search" method="post"
                  action="SearchController2">
                <input id="srchFld" name="s" class="srchTxt" type="text"/>
                <button type="submit" id="submitButton" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </form>
        </li>
        <li>
            <font color="#f5fffa">
                Добро пожаловать
            </font>
            <font color="#f5fffa">
                <strong>
                    ${sessionScope.name}
                </strong>
            </font>
        </li>
    </ul>
</div>