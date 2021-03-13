<%-- 
    Document   : dashBoard
    Created on : Jan 31, 2021, 5:14:31 PM
    Author     : paterne
--%>

<%@page import="java.sql.ResultSet"%>
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
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/html/aboutUs"><span class="fa fa-home fa-info"></span> About Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="/career_guidance/MessageProcessing"><span class="fa fa-home fa-address-card"></span> Contact Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/html/Help.jsp"><span class="fa fa-home fa-help"></span> Help?</a></li>

                        </ul>
                        <span class="navbar-text">
                            <a href="/career_guidance/logout">
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
                    <div>
                        <h1>DashBoard</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        
                        <div class="">
                            <div class="card">
                                <h3 class="card-header bg-warning text-white">Welcome 
                                <%
                                            database.Users  user =(database.Users) session.getAttribute("user");
                                            out.println(user.getUsername());
                                            %>
                                </h3>
                                <div class="card-body">
                                    <dl class="row">
                                        <button type="button" class="btn mb-5"><a href="/career_guidance/Interview"> 1. take Interview</a></button>
                                        <button type="button" class="btn"><a href="/career_guidance/FinalQuestions"> 2. attempt final Interview</a></button>
                                        
                                        
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="offset-1 col-8">
                        
                        <div class="align-self-center">
                            <div class="card">
                                <h3 class="card-header bg-warning text-white">your profile</h3>
                                <div class="card-body">
                                    <dl class="row">
                                        <dt class="col-6">Username</dt>
                                        <dd class="col-6"><%= user.getUsername() %></dd>
                                        <dt class="col-6">First Name</dt>
                                        <dd class="col-6"><%= user.getFirstName() %></dd>
                                        <dt class="col-6">Last Name</dt>
                                        <dd class="col-6"><%= user.getLastName() %></dd>
                                        <dt class="col-6">Email</dt>
                                        <dd class="col-6"><%= user.getEmail() %></dd>
                                    </dl>
                                    <div >
                                        <button class="" type="button" name="" id="editProfile"><a href="" data-toggle="modal" data-target= "#editProfileModal"><span class="fa fa-edit"></span> Edit Profile</a></button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                    <div class="row mb-5">
                                        <p></p>
                                    </div>
                <div class="row">
                    <div class="col-12 col-sm-4">
                        <div class="">
                            <div class="card">
                                <h3 class="card-header bg-warning text-white">your Records</h3>
                                <div class="card-body">
                                    <dl class="row">
                                        <%
                                            try{
                                                database.Records record = (database.Records)request.getAttribute("record");
                                                if(record != null){
                                                    
                                                
                                                %>
                                        <dt class="col-6">Your name</dt>
                                        <dd class="col-6"><%= record.getUsername() %> </dd>
                                        <dt class="col-6"> your Type </dt>
                                        <dd class="col-6"><%= record.getType() %></dd>
                                        <dt class="col-6">Your will do best in </dt>
                                        <dd class="col-6"><%= record.getOriantation() %></dd>
                                        
                                        <%
                                                }
                                                else{
                                                    out.println("<p>attempt final Question to get this result</p>");
                                                }
                                            }catch(Exception e){
                                                
                                            }finally{
                                                
                                            }
                                            %>
                                        
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4">
                        <div class="">

                            <div class="card">
                                <h3 class="card-header bg-warning text-white"> Results </h3>
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
                    <div class="col-4">
                        
                        <div class="">
                            <div class="card">
                                
                                <h3 class="card-header bg-warning text-white">Other field you consider</h3>
                                <div class="card-body">
                                    <dl class="row">
                                    <%
                                        try{
                                            ResultSet allOrientation = (ResultSet) request.getAttribute("allOrientation");
                                        
                                        
                                        while(allOrientation.next()){
                                            %>
                                            <dt class="col-12"><%= allOrientation.getString("nameOfGroup") %></dt>
                                        <%
                                        }
                                        }catch(Exception e){
                                            out.println("attempt Enterview to see this part");
                                        }finally{
                                            
                                        }
                                        
                                    
                                    %>
                                        
                                        
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                                    
                                    <div id="editProfileModal" class="modal fade" role="dialog">
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
                            <form action="Update" method="post">
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="userId" class="">User id</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="hidden" class="" value="<%= user.getUserId() %>" id="userIdTE" name="userId" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="username" class="">Username</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" value="<%= user.getUsername() %>" id="usernameTE" name="username">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="password" class="">password</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="password" class="" value="<%= user.getPassword() %>" id="passwordTE" name="password">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="firstName" class="">First Name</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" value="<%= user.getFirstName() %>" name="firstName" id="firstNameTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="lastName" class="">Last Name</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" value="<%= user.getLastName() %>" name="lastName" id="lastNameTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="email" class="">Email</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="email" class="" value="<%= user.getEmail() %>" name="email" id="emailTE">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="">Type Of User</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" value="<%= user.getTypeOfUser() %>" name="typeOfUser" id="typeOfUserTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="sr-only" >submit from</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="hidden" class="" name="tableName" id="tableName" value="users">
                                                        <input type="hidden" class="" name="nameOfPage" id="nameOfPage" value="dashboard">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="sr-only" >operation</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="hidden" class="" name="operator" value="update" id="operatorForUser">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="offset-8 form-group col-sm-4">
                                                        <div class="btn-group">
                                                            <button type="submit" class="btn btn-warning" id="changeUser" > Update</button>
                                                            <button type="reset" class="btn" id="reset" > Reset</button>
                                                            
                                                        </div>

                                                    </div>
                                                </div>
                                            </form>
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
//            
            
        </script>

    </body>
</html>