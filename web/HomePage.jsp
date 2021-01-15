<%-- 
    Document   : HomePage
    Created on : Jan 14, 2021, 5:02:33 PM
    Author     : paterne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
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
                            <li class="nav-item active"><a class="nav-link" href="#"><span class=""></span> Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="/aboutus.html"><span class=""></span> About Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="contactus.html"><span class=""></span> Contact Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="contactus.html"><span class=""></span> Help?</a></li>

                        </ul>
                        <span class="navbar-text">
                            <a href="" data-toggle="modal" data-target= "#loginModal">
                                <span class="fa fa-sign-in"></span> Register/Login
                            </a>
                        </span>
                    </div>

                </div>
            </nav>
            <div>
                
                <div class="row">
                    <div class="discr col-4 p-3 offset-1">
                        <p class="">You are struggling
                            to find a career path and 
                            need some inspiration?</p>
                    </div>
                    <div class="image offset-1 col-6">
                        <img class="image1 img-fluid" src="images/careerguidance.png" alt="carreer">

                    </div>
                </div>
            </div>
            <footer>

            </footer>

        </div>

    </body>
</html>
