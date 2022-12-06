<%--
  Created by IntelliJ IDEA.
  User: Виталий
  Date: 19.11.2022
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<style>
    body { color: #ccc }
    .footer-widget p {
        margin-bottom: 27px;
    }
    p {
        font-family: 'Nunito', sans-serif;
        font-size: 16px;
        line-height: 28px;
    }

    .animate-border {
        position: relative;
        display: block;
        width: 150px;
        height: 3px;
        background: #007bff; }

    .animate-border:after {
        position: absolute;
        content: "";
        width: 35px;
        height: 3px;
        left: 0;
        bottom: 0;
        border-left: 10px solid #fff;
        border-right: 10px solid #fff;
        -webkit-animation: animborder 2s linear infinite;
        animation: animborder 2s linear infinite; }

    @-webkit-keyframes animborder {
        0% {
            -webkit-transform: translateX(0px);
            transform: translateX(0px); }
        100% {
            -webkit-transform: translateX(113px);
            transform: translateX(113px); } }

    @keyframes animborder {
        0% {
            -webkit-transform: translateX(0px);
            transform: translateX(0px); }
        100% {
            -webkit-transform: translateX(113px);
            transform: translateX(113px); } }

    .animate-border.border-white:after {
        border-color: #fff; }

    .animate-border.border-yellow:after {
        border-color: #F5B02E; }

    .animate-border.border-orange:after {
        border-right-color: #007bff;
        border-left-color: #007bff; }

    .animate-border.border-ash:after {
        border-right-color: #EEF0EF;
        border-left-color: #EEF0EF; }

    .animate-border.border-offwhite:after {
        border-right-color: #F7F9F8;
        border-left-color: #F7F9F8; }

    /* Animated heading border */
    @keyframes primary-short {
        0% {
            width: 15%; }
        50% {
            width: 90%; }
        100% {
            width: 10%; } }

    @keyframes primary-long {
        0% {
            width: 80%; }
        50% {
            width: 0%; }
        100% {
            width: 80%; } }

    .dk-footer {
        padding: 75px 0 0;
        background-color: #151414;
        position: relative;
        z-index: 2; }
    .dk-footer .contact-us {
        margin-top: 0;
        margin-bottom: 30px;
        padding-left: 80px; }
    .dk-footer .contact-us .contact-info {
        margin-left: 50px; }
    .dk-footer .contact-us.contact-us-last {
        margin-left: -80px; }
    .dk-footer .contact-icon i {
        font-size: 24px;
        top: -15px;
        position: relative;
        color:#007bff; }

    .dk-footer-box-info {
        position: absolute;
        top: -122px;
        background: #202020;
        padding: 40px;
        z-index: 2; }
    .dk-footer-box-info .footer-social-link h3 {
        color: #fff;
        font-size: 24px;
        margin-bottom: 25px; }
    .dk-footer-box-info .footer-social-link ul {
        list-style-type: none;
        padding: 0;
        margin: 0; }
    .dk-footer-box-info .footer-social-link li {
        display: inline-block; }
    .dk-footer-box-info .footer-social-link a i {
        display: block;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        text-align: center;
        line-height: 40px;
        background: #000;
        margin-right: 5px;
        color: #fff; }
    .dk-footer-box-info .footer-social-link a i.fa-facebook {
        background-color: #3B5998; }
    .dk-footer-box-info .footer-social-link a i.fa-twitter {
        background-color: #55ACEE; }
    .dk-footer-box-info .footer-social-link a i.fa-google-plus {
        background-color: #DD4B39; }
    .dk-footer-box-info .footer-social-link a i.fa-linkedin {
        background-color: #0976B4; }
    .dk-footer-box-info .footer-social-link a i.fa-instagram {
        background-color: #B7242A; }

    .footer-awarad {
        margin-top: 285px;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-flex: 0;
        -webkit-flex: 0 0 100%;
        -moz-box-flex: 0;
        -ms-flex: 0 0 100%;
        flex: 0 0 100%;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -moz-box-align: center;
        -ms-flex-align: center;
        align-items: center; }
    .footer-awarad p {
        color: #fff;
        font-size: 24px;
        font-weight: 700;
        margin-left: 20px;
        padding-top: 15px; }

    .footer-info-text {
        margin: 26px 0 32px; }

    .footer-left-widget {
        padding-left: 80px; }

    .footer-widget .section-heading {
        margin-bottom: 35px; }

    .footer-widget h3 {
        font-size: 24px;
        color: #fff;
        position: relative;
        margin-bottom: 15px;
        max-width: -webkit-fit-content;
        max-width: -moz-fit-content;
        max-width: fit-content; }

    .footer-widget ul {
        width: 50%;
        float: left;
        list-style: none;
        margin: 0;
        padding: 0; }

    .footer-widget li {
        margin-bottom: 18px; }

    .footer-widget p {
        margin-bottom: 27px; }

    .footer-widget a {
        color: #878787;
        -webkit-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s; }
    .footer-widget a:hover {
        color: #007bff; }

    .footer-widget:after {
        content: "";
        display: block;
        clear: both; }

    .dk-footer-form {
        position: relative; }
    .dk-footer-form input[type=email] {
        padding: 14px 28px;
        border-radius: 50px;
        background: #2E2E2E;
        border: 1px solid #2E2E2E; }
    .dk-footer-form input::-webkit-input-placeholder, .dk-footer-form input::-moz-placeholder, .dk-footer-form input:-ms-input-placeholder, .dk-footer-form input::-ms-input-placeholder, .dk-footer-form input::-webkit-input-placeholder {
        color: #878787;
        font-size: 14px; }
    .dk-footer-form input::-webkit-input-placeholder, .dk-footer-form input::-moz-placeholder, .dk-footer-form input:-ms-input-placeholder, .dk-footer-form input::-ms-input-placeholder, .dk-footer-form input::placeholder {
        color: #878787;
        font-size: 14px; }
    .dk-footer-form button[type=submit] {
        position: absolute;
        top: 0;
        right: 0;
        padding: 12px 24px 12px 17px;
        border-top-right-radius: 25px;
        border-bottom-right-radius: 25px;
        border: 1px solid #007bff;
        background: #007bff;
        color: #fff; }
    .dk-footer-form button:hover {
        cursor: pointer; }

    /* ==========================

        Contact

    =============================*/
    .contact-us {
        position: relative;
        z-index: 2;
        margin-top: 65px;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -moz-box-align: center;
        -ms-flex-align: center;
        align-items: center; }

    .contact-icon {
        position: absolute; }
    .contact-icon i {
        font-size: 36px;
        top: -5px;
        position: relative;
        color: #007bff; }

    .contact-info {
        margin-left: 75px;
        color: #fff; }
    .contact-info h3 {
        font-size: 20px;
        color: #fff;
        margin-bottom: 0; }

    .copyright {
        padding: 28px 0;
        margin-top: 55px;
        background-color: #202020; }
    .copyright span,
    .copyright a {
        color: #878787;
        -webkit-transition: all 0.3s linear;
        -o-transition: all 0.3s linear;
        transition: all 0.3s linear; }
    .copyright a:hover {
        color:#007bff; }

    .copyright-menu ul {
        text-align: right;
        margin: 0; }

    .copyright-menu li {
        display: inline-block;
        padding-left: 20px; }

    .back-to-top {
        position: relative;
        z-index: 2; }
    .back-to-top .btn-dark {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        padding: 0;
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: #2e2e2e;
        border-color: #2e2e2e;
        display: none;
        z-index: 999;
        -webkit-transition: all 0.3s linear;
        -o-transition: all 0.3s linear;
        transition: all 0.3s linear; }
    .back-to-top .btn-dark:hover {
        cursor: pointer;
        background: #FA6742;
        border-color: #FA6742; }

    /* Credit to https://bootsnipp.com/snippets/ooa9M  */
</style>

<!-- Defining Footer -->
<div class="coupons">
    <div class="container">
        <div class="coupons-grids text-center">
            <div class="col-md-3 coupons-gd">
                <h3><font color="#4169e1">Шаги для совершения покупки</font></h3>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <h4><font color="#4169e1">Авторизуйтесь в Ваш аккаунт </font></h4>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                <h4><font color="#4169e1">Выберете товар</font></h4>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
                <div class="fa-3x">
                    <i class="fa-solid fa-money-check-dollar fa-flip" style="--fa-animation-duration: 3s;" ></i>
                </div>
                <h4><font color="#4169e1">Совершите оплату</font></h4>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>


<footer id="dk-footer" class="dk-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-4">
                <div class="dk-footer-box-info">
                    <p class="footer-info-text">
                    </p>
                    <div class="footer-social-link">
                        <h3>Присоединяйтесь к нашим сообществам</h3>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fab fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-google-plus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Social link -->
                </div>
                <!-- End Footer info -->
                <div class="footer-awarad">
                    <p>Computer Store 2022</p>
                </div>
            </div>
            <!-- End Col -->
            <div class="col-md-12 col-lg-8">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-us">
                            <div class="contact-icon">
                                <i class="fa fa-map-o" aria-hidden="true"></i>
                            </div>
                            <!-- End contact Icon -->
                            <div class="contact-info">
                                <h3>Minsk</h3>
                                <p>Belarus</p>
                            </div>
                            <!-- End Contact Info -->
                        </div>
                        <!-- End Contact Us -->
                    </div>
                    <!-- End Col -->
                    <div class="col-md-6">
                        <div class="contact-us contact-us-last">
                            <div class="contact-icon">
                                <i class="fa fa-volume-control-phone" aria-hidden="true"></i>
                            </div>
                            <!-- End contact Icon -->
                            <div class="contact-info">
                                <h3>999 99 99</h3>
                                <p>Позвоните нам</p>
                            </div>
                            <!-- End Contact Info -->
                        </div>
                        <!-- End Contact Us -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Contact Row -->
                <div class="row">
                    <div class="col-md-12 col-lg-6">
                        <div class="footer-widget footer-left-widget">
                            <div class="section-heading">
                                <!--   <h3>Useful Links</h3>-->
                                  <span class="animate-border border-black"></span>
                              </div>
                              <ul>
                                  <li>
                                      <a href="#">О нас</a>
                                  </li>
                                  <li>
                                      <a href="#">Сервисы</a>
                                  </li>
                                  <li>
                                      <a href="#">Проекты</a>
                                  </li>
                                  <li>
                                      <a href="#">Команда</a>
                                  </li>
                              </ul>
                              <ul>
                                  <li>
                                      <a href="#">Контакты</a>
                                  </li>
                                  <li>
                                      <a href="#">Блог</a>
                                  </li>
                                  <li>
                                      <a href="#">Отзывы</a>
                                  </li>
                                  <li>
                                      <a href="#">Вопросы</a>
                                  </li>
                              </ul>
                          </div>
                          <!-- End Footer Widget -->
                    </div>
                    <!-- End col -->
                    <div class="col-md-12 col-lg-6">
                        <div class="footer-widget">
                            <div class="section-heading">
                                <!--   <h3>Subscribe</h3>-->
                                  <span class="animate-border border-black"></span>
                              </div>
                              <form action="#">
                                  <div class="form-row">
                                      <div class="col dk-footer-form">
                                       <!--   <input type="email" class="form-control" placeholder="Email Address">
                                          <button type="submit">
                                              <i class="fa fa-send"></i>
                                          </button>-->
                                    </div>
                                </div>
                            </form>
                            <!-- End form -->
                        </div>
                        <!-- End footer widget -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Widget Row -->
    </div>
    <!-- End Contact Container -->


    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <span></span>
                </div>
                <!-- End Col -->
                <div class="col-md-6">
                    <div class="copyright-menu">
                        <ul>
                            <li>
                                <a href="index.jsp">Главная</a>
                            </li>
                            <li>
                                <a href="#"></a>
                            </li>
                            <li>
                                <a href="products.jsp">Товары</a>
                            </li>
                            <li>
                                <a href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Copyright Container -->
    </div>
    <!-- End Copyright -->
    <!-- Back to top -->
 <!--   <div id="back-to-top" class="back-to-top">
        <button class="btn btn-dark" title="Back to Top" style="display: block;">
            <i class="fa fa-angle-up"></i>
        </button>
    </div>-->
    <!-- End Back to top -->
</footer>


<!-- Credit to https://bootsnipp.com/snippets/ooa9M -->
