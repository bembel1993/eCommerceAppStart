<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //Invalidating the session and sending response back to the admin login page
    session.invalidate();
    response.sendRedirect("admin-login.jsp");
%>