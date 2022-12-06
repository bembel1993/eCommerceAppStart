<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the admin
    int id = Integer.parseInt(request.getParameter("pid"));
    String pname = request.getParameter("pname");
    String price = request.getParameter("price");
    String description = request.getParameter("description");
    String category = request.getParameter("product_category");
 //   String mprice = request.getParameter("mprice");
    String status = request.getParameter("status");
    //Querying to the database
    int updateProduct = DatabaseConnection.insertUpdateFromSqlQuery("update tblproduct set name='" + pname + "',price='" + price + "',description='" + description + "',active='" + status + "',product_category='" + category + "' where id='" + id + "'");
    if (updateProduct > 0) {
        response.sendRedirect("admin-view-product.jsp");
    } else {
        response.sendRedirect("admin-view-product.jsp");
    }
%>