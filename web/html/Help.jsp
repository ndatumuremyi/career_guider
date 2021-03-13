<%-- 
    Document   : Help
    Created on : Jan 20, 2021, 9:36:36 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?24">
        
    </head>
    <body>
        <div class="container-fluid">
            
            
            
            
            
            
            <%
                String message = (String)request.getAttribute("message");
                if(message != null){
                    %>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong><span class="fa fa-info"></span></strong> <%= message %> 
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                }
                %>
            
            
            
            
            
            
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
                            <li class="nav-item active"><a class="nav-link" href="/career_guidance/HomePage"><span class="fa fa-home fa-lg"></span> Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/html/AboutUs.jsp"><span class="fa fa-home fa-info"></span> About Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="/career_guidance/MessageProcessing"><span class="fa fa-home fa-address-card"></span> Contact Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/html/Help.jsp"><span class="fa fa-home fa-help"></span> Help?</a></li>

                        </ul>
                        <span class="navbar-text">
                            <a href="" data-toggle="modal" data-target= "#loginModal">
                                <span class="fa fa-sign-in"></span> Login
                            </a>
                            
                        </span>
                        <span class="navbar-text">
                            <a href="/career_guidance/Register">
                                
                                <span class="ml-3 fa fa-user-plus"></span> Register
                            </a>
                        </span>
                    </div>

                </div>
            </nav>
            <div id="loginModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg" role="content">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Login</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                
                            </div>
                            <form action="/career_guidance/authenticate" method="post">
                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="exampleInputEmail3" class="sr-only">Password</label>
                                        <input type="email" class="form-control form-control-sm mr-1" id="email" name="email" placeholder="Enter email">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="sr-only" for="exampleInputPassword3"></label>
                                        <input type="password" class="form-control form-control-sm mr-1" id="password" name="password" placeholder="Passowrd">
                                    </div>
                                    <div class="col-sm-auto">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" >
                                            <label class="form-check-label" for="">Remember me</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <button type="button" class="btn btn-secondary btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-warning btn-sm ml-1">Sign in</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div>

                <div class="row">
                    <div class=" col-4 p-3 offset-1">
                        <p class="">You are struggling
                            with the process ? <br> flow this guide will help you</p>
                    </div>
                    <div class="image offset-1 col-6">
                        <dl class="discr">
                            <div class="row">
                                <dt class="text-primary col-3">1. Register</dt>
                                <dd class="col-9">if you are new to this website first Of all you have to register you self. click 
                                    <b><span class="fa fa-user-plus"></span>Register</b> in right cornel of navigation
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">2. Login</dt>
                                <dd class="col-9">After registering you have to login to your account by . click 
                                    <b><span class="fa fa-sign-in"></span>Login</b> in right cornel of navigation
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">3. Take Interview</dt>
                                <dd class="col-9">after login, you have to attempt First Interview by . click 
                                    <b>Interview</b> in left side of you dashboard
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">4. Take Final Interview </dt>
                                <dd class="col-9">In order to specify a field you are good at you have to attempt final Interview  . click 
                                    <b>Interview</b> in below <b>interview</b> on dashboard
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">5. check results </dt>
                                <dd class="col-9">after attempt all interview, you fill see all information on your dashboard  . click 
                                    
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">6. Edit Profile </dt>
                                <dd class="col-9">if you want to change your profile, you can click   . click 
                                    <span class="fa fa-edit"></span><b>Edit profile</b> below your  <b>Profile info</b> on dashboard
                                </dd>
                            </div>
                            <div class="row">
                                <dt class="text-primary col-3">7. Re-attempt interview </dt>
                                <dd class="col-9">if you want you can re-attempt again, simply click on what you want to <b>atend</b> again.
                                </dd>
                            </div>
                        </dl>

                    </div>
                </div>
            </div>
            <footer class="footer bg-sucess">
                <div class="container">
                    <div class="row">             
                        <div class="col-4 offset-1 col-sm-2">
                            <h5>Links</h5>
                            <ul class="list-unstyled">
                                <li><a href="/career_guidance/HomePage">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/html/AboutUs.jsp">About</a></li>
                                <li><a href="${pageContext.request.contextPath}/html/Help.jsp">Help?</a></li>
                                <li><a href="/career_guidance/MessageProcessing">Contact</a></li>
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
                                <i class="fa fa-envelope fa-lg"></i>: <a href="mailto:uwitonze@gmail.com">uwitonze@gmail.com</a>
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
