<%-- 
    Document   : Interview
    Created on : Jan 29, 2021, 7:43:09 AM
    Author     : paterne
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.Questions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/main.css?12">
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
                            <a href="" data-toggle="modal" data-target= "#loginModal">
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
                            <form action="authenticate" method="post">
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

            <div class="contents">
                
                <form action="Interview" method="get">
                    <div class="">
                        <%
                            for(Questions question :(ArrayList<Questions>) request.getAttribute("questions")){
                                %>
                                <div class="form-row question p-3">
                                    <div class="offset-3 col-3 ">
                                        <label><%= question.getQuestion() %> </label>
                                    </div>
                                    <div class="col-2">
                                        <input type="radio" name="<%= question.getQId() + "question" %>" required><label>True</label>
                                    </div>
                                    <div class="col-2">
                                         <input type="radio" name="<%= question.getQId() + "question" %>"><label>False</label>
                                    </div>
                                </div>
                                
                                <%
                            }
                            request.getAttribute("questions");
                        %>
                    </div>
                
                
                
                
                <div class="row justify-content-center">
                    <nav aria-label="Page navigation">
                        
                        <!--<input name="page"class="sr-only" value="1">-->
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <button class="page-link pages-nav" id="prev" type="submit" tabindex="-1">Previous</button>
                            </li>
                            <%
                                try{
                                    
                                for(int i =1; i <= (int)(request.getAttribute("totalPages"));i++){
                                    %>
                                    <li class="page-item " id="<%= i +'l' %>"><input class="page-link" type="submit" name="page" value="<%= i %>">
                                    
                                    <%
                                        
                                }
                                }
                                catch(Exception e){
                                    out.print("<button class='page-link pages-nav' id='next' type='submit'>fail</button>");
                                }
                                finally{
                                    out.println();
                                }
                            %>
                            <li>
                                <button class="page-link pages-nav" id="next" type="submit">Next</button>
                            </li>
                        </ul>
                        </form>
                    </nav>
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
        <script type="text/javascript">
//            $(document).ready(function () {
//                var pagesNav = $(".pages-nav");
//            pagesNav.click(function(){
//               id = $(this).attr("id");
//               page = id.replaceAll('p','');
//               if(page ==1 ){
//                   alert("hello");
//               }
//            });
//            pagesNav.submit();
//            });
            
        </script>

    </body>
</html>
