<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int deleteProduct = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblproduct where id='" + id + "' ");
    if (deleteProduct > 0) {
        response.sendRedirect("admin-view-product.jsp");
    } else {
        response.sendRedirect("admin-view-product.jsp");
    }
%>