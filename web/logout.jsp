<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //Invalidating the session and sending response back to the customer index page
    session.invalidate();
    response.sendRedirect("index.jsp");
%>