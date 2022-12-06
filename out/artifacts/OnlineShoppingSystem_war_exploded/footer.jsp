<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Defining Footer -->
<div class="coupons">
    <div class="container">
        <div class="coupons-grids text-center">
            <div class="col-md-3 coupons-gd">
                <h3><font color="#4169e1">Simple Steps to buy online</font></h3>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <h4><font color="#4169e1">LOGIN TO YOUR ACCOUNT</font></h4>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                <h4><font color="#4169e1">SELECT YOUR ITEM</font></h4>
            </div>
            <div class="col-md-3 coupons-gd">
                <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
                <div class="fa-3x">
                <i class="fa-solid fa-money-check-dollar fa-flip" style="--fa-animation-duration: 3s;" ></i>
                </div>
                    <h4><font color="#4169e1">MAKE PAYMENT</font></h4>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<section class="footer-section">
    <div class="row">
        <div class="col">
            <div class="sign-grds">
                <div class="col-md-3 sign-gd-two">
                    <h4 style="text-align: left;"><font color="#4169e1">Contact Us:</font></h4>
                    <ul style="text-align: left;">
                        <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : USA, <span>Los Angeles.</span></li>
                        <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="mailto:info@data-flair.training">vitalibembel1.21@gmail.com</a></li>
                        <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : +375(44)5105451</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <br/><br/><br/>
            <center>
                <div class="container">
                    <h4>
                        &copy;  <span id="year"></span> Online Shop Computer Store | </a>
                    </h4>
                </div>
            </center>
        </div>
    </div>
</section>
<script>
    document.getElementById("year").innerHTML = new Date().getFullYear();
</script>