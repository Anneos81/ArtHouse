package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arthouse.domain.*;
import com.arthouse.dao.*;


@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(true);
		Seller seller = (Seller) session.getAttribute("user-object");
		int sellerid = seller.getUser_id();
		
		//reading parameters from request
		String title = request.getParameter("ptitle");
		String pr = request.getParameter("pprice");
		int price = Integer.parseInt(pr);
		String category = request.getParameter("pcategory");
		String dimensions = request.getParameter("pdimensions");
		String description = request.getParameter("pdescription");
		String pid = request.getParameter("pid");
		int product_id = Integer.parseInt(pid);
		
		
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/profileseller.jsp");
		
				
		try {
			
			Product product = new Product(product_id, sellerid, title, price, description,
					dimensions, category);
			System.out.println(product.toString());
			ProductDAO pro = new ProductDAO();

			pro.open(); // open connection
			System.out.println("h bash anoikse");

			pro.updateProduct(product); //store product to database
			System.out.println("h methodos kalesthke");

			pro.close(); // close connection

			//request.setAttribute("product", product); //adding Product object to request

			succdis.forward(request, response);
			return;
			

		} catch (Exception e) {
			
			request.setAttribute("errormessage", e.getMessage());
			
			errodis.forward(request, response);	
		}

	}		
				
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
