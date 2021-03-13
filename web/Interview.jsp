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
                            <a href="/career_guidance/Logout">
                                <span class="fa fa-sign-in"></span> Logout
                            </a>

                        </span>
                        <%
                            try{
                                database.Users user =(database.Users) session.getAttribute("user");
                                %>
                        <span class="navbar-text">
                            <a href="#">

                                <span class="ml-3 fa fa-user-circle"></span> <%= user.getUsername() %>
                            </a>
                        </span>
                        <%
                            }catch(Exception e){
                                
                            }
                            
                            %>
                    </div>

                </div>
            </nav>
            

            <div class="contents">
                <div class="row">
                    <div class=" offset-3 col-6">
                <form action="Interview" method="get">
                    <input type="hidden" name="prevPage" value="<%= request.getAttribute("prevPage") %>">
                    <div class="">
                        <%
                            for(Questions question :(ArrayList<Questions>) request.getAttribute("questions")){
                                %>
                                <div class="form-row question p-3">
                                    <div class="offset-3 col-3 ">
                                        <label><%= question.getQuestion() %> </label>
                                    </div>
                                    <div class="col-2">
                                        <input type="radio" value="true" name="<%= question.getQId() + "question" %>" required><label>True</label>
                                    </div>
                                    <div class="col-2">
                                         <input type="radio" value="false" name="<%= question.getQId() + "question" %>"><label>False</label>
                                    </div>
                                </div>
                                
                                <%
                            }
//                            request.getAttribute("questions");
                        %>
                        <div class="row">
                            <div class="offset-9 col-3">
                                <%
                                    try{
                                        if( Boolean.parseBoolean((String) request.getAttribute("isFinalPage"))){
                                        %>
                                        <button class="btn" type="submit" name="submit" value="finish" >Finish</button>
                                        <%
                                    }
                                    }catch(Exception e){
                                        
                                    }finally{
                                        
                                    }
                                    
                                    %>
                            </div>
                        </div>
                    </div>
                
                
                
                
                <div class="row justify-content-center">
                    <nav aria-label="Page navigation">
                        
                        <!--<input name="page"class="sr-only" value="1">-->
                        <ul class="pagination">
                            <%
                                try{
                                    if(((int)request.getAttribute("prevPage")) == 1){
                                        %>
<!--                                    <li>
                                        <button class="page-link pages-nav" id="next" type="hidden" name="submit" value="next">Next</button>
                                    </li>-->
                                        <%
                                    }else{
                                    %>
                                    <li class="page-item">
                                <button class="page-link pages-nav" id="prev" type="submit" tabindex="-1" name="submit" value="prev" >Previous</button>
                            </li>  
                                    <%
                                    }
                                }catch(Exception e){
                                    %>
                                    <li class="page-item">
                                <button class="page-link pages-nav" id="prev" type="submit" tabindex="-1" name="submit" value="prev" >Previous</button>
                            </li>
                                    <%
                                }finally{
                                    
                                }
                            %>
                            
                            <%
                                try{
                                    
                                for(int i =1; i <= (int)(request.getAttribute("totalPages"));i++){
                                    if(((int)request.getAttribute("prevPage"))== i){
                                        %>
                                    <li class="page-item" id="<%= i +'l' %>"><input class="page-link bg-warning" type="submit" name="page" value="<%= i %>">
                                    
                                    <%
                                    }
                                        else{
                                    %>
                                    <li class="page-item " id="<%= i +'l' %>"><input class="page-link" type="submit" name="page" value="<%= i %>">
                                    
                                    <%
                                        }
                                }
                                }
                                catch(Exception e){
                                    out.print("<button class='page-link pages-nav' id='next' type='submit'>fail</button>");
                                }
                                finally{
                                
                                    out.println();
                                }
                                try{
                                    if(((int)request.getAttribute("prevPage")) >= ((int)request.getAttribute("totalPages"))){
                                        %>
<!--                                    <li>
                                        <button class="page-link pages-nav" id="next" type="hidden" name="submit" value="next">Next</button>
                                    </li>-->
                                        <%
                                    }else{
                                    %>
                                    <li>
                                    <button class="page-link pages-nav" id="next" type="submit" name="submit" value="next">Next</button>
                                    </li>    
                                    <%
                                    }
                                }catch(Exception e){
                                    %>
                                    <li>
                                    <button class="page-link pages-nav" id="next" type="submit" name="submit" value="next">Next</button>    
                                    </li>
                                    <%
                                }finally{
                                    
                                }
                            %>
                            
                        </ul>
                        </form>
                    </nav>
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
                                <li><a href="${pageContext.request.contextPath}/html/Help.jsp">help</a></li>
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
