package com.controller.servletAddEdit;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {

    //Path where all the images are stored
    private final String UPLOAD_DIRECTORY = "D:\\Activity\\Programming\\ПрилИС_2\\4_Git, Hibernate, JUnit, Servlets, Patterns\\Lab_8_Spring\\draftjavaWeb\\EXAMPLE FOR WORK\\OnlineShoppingSystem\\web\\uploads\\";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String active = request.getParameter("status");
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        String nameprod = request.getParameter("nameprod");
        String price = request.getParameter("price");
        String product_category = request.getParameter("product_category");
        String product_img_source = request.getParameter("product_img_source");

        // Customer customer = new Customer(address, email, gender, password, mobile, pincode);
        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
            int addProduct = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblproduct(active,code,description,name,price,product_category,product_img_source)values('" + active + "','" + code + "','" + description + "','" + nameprod + "','" + price + "','"
                    + product_category + "','" + product_img_source + "')");
            // int addCustomer = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcustomer(address,email,gender,name,password,phone,pin_code)values('" + customer +"')");
            //If customer registered successfully
            if (addProduct > 0) {
                String success = "Product added successfully.";
                //Adding method in session.
                hs.setAttribute("message", success);
                //Sending response back to the user/customer
                response.sendRedirect("admin-add-product.jsp");
            } else {
                //If customer fails to register
                String message = "Product not add";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("admin-add-product.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

  /*      String status = request.getParameter("status");
        // String code = request.getParameter("code");
        String descrip = request.getParameter("description");
        String productName = request.getParameter("pname");
        String productPrice = request.getParameter("price");
        String category = request.getParameter("category");
        String product_img_source = request.getParameter("product_img_source");
        //Creating session
        HttpSession session = request.getSession();

        try {
            //Taking all image requests
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            /*    String imageName = null;
                String productName = null;
                String productQuantity = null;
                String productPrice = null;
                String descrip = null;
                String status = null;
                String category = null;
                String product_img_source = null;*/

            //SALTCHARS to generate unique code for product
         /*   String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder salt = new StringBuilder();
            Random rnd = new Random();
            while (salt.length() < 3) { // length of the random string.
                int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                salt.append(SALTCHARS.charAt(index));
            }
            String code = salt.toString();
            try {
                //      String imagePath = UPLOAD_DIRECTORY + imageName;
                //Querying to insert product in the table
                int addProduct = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblproduct(id,active,code,description,name,price,product_category, product_img_source) values('" + status + "','" + code + "','" + descrip + "','" + productName + "','" + productPrice + "','" + category + "','" + product_img_source + "')");
                //If product inserted sucessfully in the database
                if (addProduct > 0) {
                    String success = "Product added successfully.";
                    //Adding method in session.
                    session.setAttribute("message", success);
                    //Response send to the admin-add-product.jsp
                    response.sendRedirect("admin-add-product.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception ex) {
            //If any occur occured
            request.setAttribute("message", "File Upload Failed due to " + ex);
        }
    }*/
}
