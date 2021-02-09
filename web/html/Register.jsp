<%-- 
    Document   : Register
    Created on : Feb 4, 2021, 10:48:37 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css?4">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css?2">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?18">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css?12">
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
                            <a href="${pageContext.request.contextPath}/Login.jsp">
                                <span class="fa fa-sign-in"></span> Login
                            </a>
                            
                        </span>
                        <span class="navbar-text">
                            <a href="#">
                                
                                <span class="ml-3 fa fa-user-plus"></span> Register
                            </a>
                        </span>
                    </div>

                </div>
            </nav>
            

            <div class="contents">
                <div class="container">
		<div class="d-flex justify-content-center">
			<div class="register_card">
				
				<div class="d-flex justify-content-center form_container">
                                    <form action="Register" method="post">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-envelope"></i></span>
							</div>
							<input type="email" name="email" class="form-control input_user" value="" placeholder="Email">
						</div>
                                        <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-id-card"></i></span>
							</div>
							<input type="text" name="firstName" class="form-control input_user" value="" placeholder="First Name">
						</div>
                                        <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-id-card-o"></i></span>
							</div>
							<input type="text" name="lastName" class="form-control input_user" value="" placeholder="Last Name">
						</div>
                                        <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-user"></i></span>
							</div>
							<input type="text" name="username" class="form-control input_user" value="" placeholder="username">
						</div>
                                        <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-user-circle"></i></span>
							</div>
                                            <select class="form-control input_user" name="typeOfUser">
                                                <option>s3</option>
                                                <option>s6</option>
                                                <option>Job seeker</option>
                                            </select>
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-key"></i></span>
							</div>
							<input type="password" name="password" class="form-control input_pass" value="" placeholder="password">
						</div>
                                                <div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-check"></i></span>
							</div>
							<input type="password" name="confirmPassword" class="form-control input_pass" value="" placeholder="Confirm password">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label class="custom-control-label" for="customControlInline">Remember me</label>
							</div>
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
                                                            <button type="submit" name="register" class="btn login_btn" value="register"><span class="fa fa-user-plus"></span> Register</button>
				   </div>
					</form>
				</div>
		
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						already have an account? <a class="nav-link" href="Login.jsp"><span class="ml-3 fa fa-sign-in"></span> Login</a>
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
                                <li><a href="/career_guidance/HomePage">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/html/AboutUs.jsp">About</a></li>
                                <li><a href="${pageContext.request.contextPath}/html/Help.jsp">Help</a></li>
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
