package com.controller.servletAddEdit;

import com.connection.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddMessageAdmin")
public class AddMessageAdmin extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message_send = request.getParameter("message_send");

        //Creating Session
        HttpSession hs = request.getSession();
        try {
            //  ResultSet retriveCustomer = DatabaseConnection.getResultFromSqlQuery("select name from tblcustomer where id ='" + request.getParameter("id") + "'");
            String nameCust = "Admin";
            int addMessage = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblmessage(message_send,name)values('" + message_send + "','" + nameCust + "')");
            if (addMessage > 0) {
                String message = "Message send successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("admin-chat.jsp");
            } else {
                //If customer fails to register
                String message = "Message send fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("admin-chat.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

