package com.controller.servletAddEdit;

import com.connection.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddMessage")
public class AddMessage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message_send = request.getParameter("message_send");

        //Creating Session
        HttpSession hs = request.getSession();

        try {
          //Get the name of the created session
            String custName = (String) hs.getAttribute("name");

            int addMessage = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblmessage(message_send,name)values('" + message_send + "','" + custName + "')");

            if (addMessage > 0) {
                String message = "Message send successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("my-chat.jsp");
            } else {
                //If customer fails to register
                String message = "Message send fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("my-chat.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
