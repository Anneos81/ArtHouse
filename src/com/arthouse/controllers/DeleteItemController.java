package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arthouse.dao.ProductDAO;
import com.arthouse.dao.SellerDAO;
import com.arthouse.domain.Product;
import com.arthouse.domain.Seller;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class DeleteItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }
				
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(true);
		Seller seller = (Seller) session.getAttribute("user-object");
		int sellerid = seller.getUser_id();
		
		//reading parameters from request
		String pid = request.getParameter("pid");
		int product_id = Integer.parseInt(pid);
		System.out.println("pid" + product_id );
		
		
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/profileseller.jsp");
		
				
		try {
			
			SellerDAO sdao = new SellerDAO();
 
			sdao.open(); // open connection
			System.out.println("h bash anoikse");

			sdao.deleteProduct(product_id); //store product to database
			System.out.println("h methodos kalesthke");

			sdao.close(); // close connection

			//request.setAttribute("product", product); //adding Product object to request

			succdis.forward(request, response);
			return;
			

		} catch (Exception e) {
			
			request.setAttribute("errormessage", e.getMessage());
			
			errodis.forward(request, response);	
		}

	}		

}
