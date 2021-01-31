<%-- 
    Document   : Admin
    Created on : Jan 26, 2021, 11:51:00 AM
    Author     : paterne
--%>

<%@page import="database.Results"%>
<%@page import="database.Records"%>
<%@page import="database.Questions"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Admin page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?28">
    </head>
    <body>
        <div class="container-fluid">
            <div class="title">
                <h1>Admin panel</h1>
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
                            <form action="">
                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="exampleInputEmail3" class="sr-only">Password</label>
                                        <input type="email" class="form-control form-control-sm mr-1" id="exampleInputEmail3" placeholder="Enter email">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="sr-only" for="exampleInputPassword3"></label>
                                        <input type="password" class="form-control form-control-sm mr-1" id="exampleInputPassword3" placeholder="Passowrd">
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

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            





            <div id="EditUserModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg" role="content">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">

                                    <div class="card">
                                        <h3 class="card-header bg-warning text-white">
                                            Edit part
                                        </h3>
                                        <div class="card-body">
                                            <form action="Update" method="post">
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="userId" class="">User id</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" id="userIdTE" name="userId" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="username" class="">Username</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" id="usernameTE" name="username">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="password" class="">password</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="password" class="" id="passwordTE" name="password">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="firstName" class="">First Name</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" name="firstName" id="firstNameTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="lastName" class="">Last Name</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" name="lastName" id="lastNameTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="email" class="">Email</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="email" class="" name="email" id="emailTE">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="">Type Of User</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="text" class="" name="typeOfUser" id="typeOfUserTE">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="sr-only" >submit from</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="hidden" class="" name="tableName" id="tableName" value="users">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-4">
                                                        <label for="typeOfUser" class="sr-only" >operation</label>
                                                    </div>
                                                    <div class="form-group col-sm-8">
                                                        <input type="hidden" class="" name="operator" value="" id="operator">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="offset-8 form-group col-sm-4">
                                                        <div class="btn-group">
                                                            <button type="submit" class="btn btn-warning" id="changeUser" > Update</button>
                                                            <button type="reset" class="btn" id="reset" > Reset</button>
                                                            <button type="submit" class="btn btn-warning" id="addUserFinal" > Add</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>








            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            


            <div class="contents">

                <div class="row row-content">
                    <div class="col-12">
                        <ul class="nav nav-tabs navbar-custom">
                            <li class="nav-item">
                                <a class="nav-link active" href="#users" role="tab" data-toggle="tab">
                                    users
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#questions" role="tab" data-toggle="tab">
                                    questions
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#records" role="tab" data-toggle="tab">
                                    records
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#results" role="tab" data-toggle="tab">
                                    results
                                </a>
                            </li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" role="tabpanel" id="users">
                                <h3>user part</h3>
                                <div class="row row-content">
                                    <div class="col-12 col-sm-9">
                                        <h2>Facts &amp; Figures</h2>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>user Id</th>
                                                        <th>username</th>
                                                        <th>password</th>
                                                        <th>first name</th>
                                                        <th>last name</th>
                                                        <th>email</th>
                                                        <th>type of user</th>
                                                        <th>Operations</th>
                                                    </tr>

                                                </thead>
                                                <tbody>

                                                    <%

                                                        try {
                                                            for (Users user : (ArrayList<Users>) request.getAttribute("users")) {

                                                    %>
                                                    <tr class="trOfData" id="<%= user.getUserId() + "userTr"%>">
                                                        <td>
                                                            <%= user.getUserId()%>
                                                        </td>
                                                        <td id="usernameTd">
                                                            <%= user.getUsername()%>
                                                        </td>
                                                        <td>
                                                            <%= user.getPassword()%>
                                                        </td>
                                                        <td>
                                                            <%= user.getFirstName()%>
                                                        </td>
                                                        <td>
                                                            <%= user.getLastName()%>
                                                        </td>
                                                        <td>
                                                            <%= user.getEmail()%>
                                                        </td>
                                                        <td>
                                                            <%= user.getTypeOfUser()%>
                                                        </td>
                                                        <th>
                                                            <div class="btn-group" role="group">
                                                                <a role="button" class="btn btn-primary editUser" id="<%= user.getUserId()%>"><i class="fa fa-edit"></i>Edit</a>
                                                                <a role="button" class="btn btn-danger deleteUser" id="<%= user.getUserId()%>"><i class="fa fa-trash"></i> Delete</a>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                    <%

                                                            }
                                                        } catch (Exception e) {
                                                            out.println("error occur");
                                                        } finally {
                                                            out.println();
                                                        }
                                                    %>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="offset- col-12 col-sm-3"></div>
                                </div>
                                <div class="row">
                                    <div class="offset-9 col-12 col-sm-3">
                                        <button class="btn btn-warning" id="addUser">
                                           
                                                <span class="fa fa-plus"></span> Add
                                            
                                        </button>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" role="tabpanel" id="questions">
                                <h3>this question pane</h3>
                                <div class="row row-content">
                                    <div class="col-12 col-sm-9">
                                        <h2>Facts &amp; Figures</h2>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Question Id</th>
                                                        <th>Question</th>
                                                        <th>Type of question</th>
                                                        <th>group</th>
                                                        <th> Target User</th>
                                                        <th>Operations</th>

                                                    </tr>

                                                </thead>
                                                <tbody>

                                                    <%
                                                        try {
                                                            for (Questions question : (ArrayList<Questions>) request.getAttribute("questions")) {

                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%= question.getQId()%>
                                                        </td>
                                                        <td>
                                                            <%= question.getQuestion()%>
                                                        </td>
                                                        <td>
                                                            <%= question.getRiasecType()%>
                                                        </td>
                                                        <td>
                                                            <%= question.getGroup()%>
                                                        </td>
                                                        <td>
                                                            <%= question.getTargetUser()%>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group" role="group">
                                                                <a role="button" class="btn btn-primary editQuestion" id="<%= question.getQId() + "edit"%>"><i class="fa fa-edit"></i>Edit</a>
                                                                <a role="button" class="btn btn-danger deleteQuestion" id="<%= question.getQId() + "delete"%>"><i class="fa fa-delete"></i> Delete</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%

                                                            }
                                                        } catch (Exception e) {
                                                            out.println("error occur");
                                                        } finally {
                                                            out.println();
                                                        }
                                                    %>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-3"></div>
                                </div>
                                <div class="row">
                                    <div class="offset-9 col-12 col-sm-3">
                                        <button class="btn btn-warning">Add</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" role="tabpanel" id="records">
                                <h3>this records pane</h3>
                                <div class="row row-content">
                                    <div class="col-12 col-sm-9">
                                        <h2>Facts &amp; Figures</h2>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Records Id</th>
                                                        <th>Username</th>
                                                        <th>Type</th>
                                                        <th>Orientation</th>
                                                        <th>Operations</th>

                                                    </tr>

                                                </thead>
                                                <tbody>

                                                    <%
                                                        try {
                                                            for (Records record : (ArrayList<Records>) request.getAttribute("records")) {

                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%= record.getRId()%>
                                                        </td>
                                                        <td>
                                                            <%= record.getUsername()%>
                                                        </td>
                                                        <td>
                                                            <%= record.getType()%>
                                                        </td>
                                                        <td>
                                                            <%= record.getOriantation()%>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group" role="group">
                                                                <a role="button" class="btn btn-primary editRecord" id="<%= record.getRId() + "edit"%>"><i class="fa fa-edit"></i>Edit</a>
                                                                <a role="button" class="btn btn-danger deleteRecord" id="<%= record.getRId() + "delete"%>"><i class="fa fa-delete"></i> Delete</a>
                                                            </div>
                                                        </td>

                                                    </tr>
                                                    <%

                                                            }
                                                        } catch (Exception e) {
                                                            out.println("error occur");
                                                        } finally {
                                                            out.println();
                                                        }
                                                    %>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-3"></div>
                                </div>
                                <div class="row">
                                    <div class="offset-9 col-12 col-sm-3">
                                        <button class="btn btn-warning">Add</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" role="tabpanel" id="results">
                                <h3>this result pane</h3>
                                <div class="row row-content">
                                    <div class="col-12 col-sm-9">
                                        <h2>Facts &amp; Figures</h2>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>result Id</th>
                                                        <th>Username</th>
                                                        <th>Realistic</th>
                                                        <th>Social</th>
                                                        <th>Investigative</th>
                                                        <th>Enterprising</th>
                                                        <th>Artistic</th>
                                                        <th>Conventional</th>
                                                        <th>Operations</th>

                                                    </tr>

                                                </thead>
                                                <tbody>

                                                    <%
                                                        try {
                                                            for (Results result : (ArrayList<Results>) request.getAttribute("results")) {

                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%= result.getRId()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getUsername()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getRealistic()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getSocial()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getInvestigative()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getEnterprising()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getArtistic()%>
                                                        </td>
                                                        <td>
                                                            <%= result.getConventional()%>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group" role="group">
                                                                <a role="button" class="btn btn-primary editResult" id="<%= result.getRId() + "edit"%>"><i class="fa fa-edit"></i>Edit</a>
                                                                <a role="button" class="btn btn-danger deleteResult" id="<%= result.getRId() + "delete"%>"><i class="fa fa-delete"></i> Delete</a>
                                                            </div>
                                                        </td>

                                                    </tr>
                                                    <%

                                                            }
                                                        } catch (Exception e) {
                                                            out.println("error occur");
                                                        } finally {
                                                            out.println();
                                                        }
                                                    %>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-3"></div>
                                </div>
                                <div class="row">
                                    <div class="offset-9 col-12 col-sm-3">
                                        <button class="btn btn-warning">Add</button>
                                    </div>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var add = $("#addUser");
                add.click(function(){
                    $("#changeUser").hide();
                    $("#addUserFinal").show();
                    $("#operator").attr("value","add");
                    $("#EditUserModal").modal('show');
                });
                
                var edit = $(".editUser");
                edit.click(function () {
                    $("#changeUser").show();
                $("#addUserFinal").hide();
                $("#operator").attr("value","update");
                    var id = $(this).attr("id");
                    $(".trOfData").each(function () {
                        var trId = $(this).attr("id");
                        if (trId.includes(id)) {
                            var condit = "#" + trId + " td";
//                           var tr= $(condit).eq(1).text();
//                           var userId = tr.trim();
//                             $("#usernameTE").val(userId);
                            $("#userIdTE").val($.trim($(condit).eq(0).text()));
                            $("#usernameTE").val($.trim($(condit).eq(1).text()));
                            $("#passwordTE").val($.trim($(condit).eq(2).text()));
                            $("#firstNameTE").val($.trim($(condit).eq(3).text()));
                            $("#lastNameTE").val($.trim($(condit).eq(4).text()));
                            $("#emailTE").val($.trim($(condit).eq(5).text()));
                            $("#typeOfUserTE").val($.trim($(condit).eq(6).text()));

//                           
//                           

                        }
                    });

                    $("#EditUserModal").modal('show');


                });
            });
        </script>

    </body>
</html>