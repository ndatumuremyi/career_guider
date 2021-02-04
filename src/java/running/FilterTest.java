///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package running;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author paterne
// */
//@WebFilter("/admin/*")
//public class FilterTest implements Filter{
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        
//       HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpSession session = httpRequest.getSession(false);
// 
//        boolean isLoggedIn = (session != null && session.getAttribute("adminUser") != null);
// 
//        String loginURI = httpRequest.getContextPath() + "/admin/login";
// 
//        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
// 
//        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
// 
//        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
//            // the admin is already logged in and he's trying to login again
//            // then forwards to the admin's homepage
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
//            dispatcher.forward(request, response);
// 
//        } else if (isLoggedIn || isLoginRequest) {
//            // continues the filter chain
//            // allows the request to reach the destination
//            chain.doFilter(request, response);
// 
//        } else {
//            // the admin is not logged in, so authentication is required
//            // forwards to the Login page
//            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//            dispatcher.forward(request, response);
// 
//        }
// 
//    }
// 
//    public FilterTest() {
//    }
// 
//    @Override
//    public void destroy() {
//    }
// 
//    public void init(FilterConfig fConfig) throws ServletException {
//    }
// 
//}