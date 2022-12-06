package com.controller.servletSearchEngine;

import com.dao.ListProductDAO;
import com.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SearchController2
 */
@WebServlet("/SearchController3")
public class SearchController3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchController3() {
        super();
        // TODO Auto-generated constructor stub
    }

/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            String text = request.getParameter("s");
            List<Product> l = new ListProductDAO().search(text);
            request.setAttribute("success", "In Stock!");
            request.setAttribute("products", l);
            if (l.size()==0) {
                request.setAttribute("error", "No results!");
            }
            else {
                request.setAttribute("error", "");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin-search.jsp?text="+text);
            rd.forward(request, response);

        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }
}
