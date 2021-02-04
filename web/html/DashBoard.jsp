<%-- 
    Document   : dashBoard
    Created on : Jan 31, 2021, 5:14:31 PM
    Author     : paterne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?28">
    </head>
    <body>
        <div class="container-fluid">
            <div class="title">
                <h1>Welcome to Career guider</h1>
            </div>
            <nav class="navbar navbar-dark navbar-expand-sm">

                <div class="container">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--<a class="navbar-brand mr-auto" href="#"><img src="img/logo.png" height="30" width="41" ></a>-->
                    <div class="collapse navbar-collapse" id="Navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-home fa-lg"></span> Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="/aboutus.html"><span class="fa fa-home fa-info"></span> About Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="contactus.html"><span class="fa fa-home fa-address-card"></span> Contact Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="contactus.html"><span class="fa fa-home fa-help"></span> Help?</a></li>

                        </ul>
                        <span class="navbar-text">
                            <a href="/career_guidance/logout">
                                <span class="fa fa-sign-in"></span> Logout
                            </a>

                        </span>
                        <span class="navbar-text">
                            <a href="#">

                                <span class="ml-3 fa fa-user-plus"></span> Profile
                            </a>
                        </span>
                    </div>

                </div>
            </nav>


            <div class="contents">

                <div class="row">
                    <div>
                        <h1>DashBoard</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <div class="">

                            <div class="card">
                                <h3 class="card-header bg-primary text-white"> Results </h3>
                                <div class="card-body">
                                    <dl class="row">
                                        <%
                                            try {
                                                database.Results result = (database.Results) request.getAttribute("result");

                                                if (request.getAttribute("result") != null) {


                                        %>
                                        <dt class="col-6"> In Artistic </dt>
                                        <dd class="col-6"><%= result.getArtistic()%> % </dd>
                                        <dt class="col-6">In Conventional</dt>
                                        <dd class="col-6"><%= result.getConventional()%> % </dd>
                                        <dt class="col-6">In Enterprising </dt>
                                        <dd class="col-6"><%= result.getEnterprising()%> % </dd>
                                        <dt class="col-6">In Investigative</dt>
                                        <dd class="col-6"><%= result.getInvestigative()%> % </dd>
                                        <dt class="col-6">In Realistic</dt>
                                        <dd class="col-6"><%= result.getRealistic()%> % </dd>
                                        <dt class="col-6">In Social</dt>
                                        <dd class="col-6"><%= result.getSocial()%> % </dd>
                                        <%
                                                } else {
                                                    %>
                                                    <dd><b>take interview first</b></dd>
                                                    <%
                                                }
                                            } catch (Exception e) {

                                            }
                                        %>
                                    </dl>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-12 col-sm-6">
                        <div class="">
                            <div class="card">
                                <h3 class="card-header bg-primary text-white">Facts at a Glance</h3>
                                <div class="card-body">
                                    <dl class="row">
                                        <dt class="col-6">Started</dt>
                                        <dd class="col-6">3 Feb. 2013</dd>
                                        <dt class="col-6">Major Stake Holder</dt>
                                        <dd class="col-6">HK Fine Foods Inc.</dd>
                                        <dt class="col-6">Last Year's Turnover</dt>
                                        <dd class="col-6">$1,250,375</dd>
                                        <dt class="col-6">Employees</dt>
                                        <dd class="col-6">40</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer bg-sucess">
                <div class="container">
                    <div class="row">             
                        <div class="col-4 offset-1 col-sm-2">
                            <h5>Links</h5>
                            <ul class="list-unstyled">
                                <li><a href="#">Home</a></li>
                                <li><a href="./aboutus.html">About</a></li>
                                <li><a href="#">Menu</a></li>
                                <li><a href="contactus.html">Contact</a></li>
                            </ul>
                        </div>
                        <div class="col-7 col-sm-5">

                            <h5>Our Address</h5>
                            <address>
                                KN 7 Ave<br>
                                Collage of  Science and Technology<br>
                                Kigali<br>
                                <i class="fa fa-phone fg-lg"></i> +250 786388768<br>
                                <i class="fa fa-fax fa-lg"></i>: +250 786388768<br>
                                <i class="fa fa-envelope fa-lg"></i>: <a href="mailto:paternenught@gmail.com">paternenught@gmail.com</a>
                            </address>
                        </div>
                        <div class="col-12 col-sm-4 align-self-center">
                            <div class="text-center">
                                <a class="btn btn-social-icon btn-google" href="http://google.com/+"><i class="fa fa-google-plus fa-lg"></i></a>
                                <a class="btn btn-social-icon btn-facebook" href="http://www.facebook.com/profile.php?id="><i class="fa fa-facebook fa-lg"></i></a>
                                <a class="btn btn-social-icon btn-linkedin" href="http://www.linkedin.com/in/"><i class="fa fa-linkedin fa-lg"></i></a>
                                <a class="btn btn-social-icon btn-twitter" href="http://twitter.com/"><i class="fa fa-twitter fa-lg"></i></a>
                                <a class="btn btn-social-icon btn-google" href="http://youtube.com/"><i class="fa fa-youtube fa-lg"></i></a>
                                <a class="btn btn-social-icon" href="mailto:"><i class="fa fa-envelope fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">             
                        <div class="col-auto">
                            <p>© Copyright 2021 Career Guider</p>
                        </div>
                    </div>
                </div>
            </footer>

        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>

    </body>
</html>