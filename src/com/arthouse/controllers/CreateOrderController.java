package com.arthouse.controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arthouse.dao.BuyerDAO;
import com.arthouse.dao.OrderDAO;
import com.arthouse.domain.Basket;
import com.arthouse.domain.Buyer;
import com.arthouse.domain.Order;

/**
 * Servlet implementation class CreateOrderController
 */
@WebServlet("/createOrder")
public class CreateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/buyer_myorders.jsp");

		try {
			HttpSession session = request.getSession(true);
			double amount =  (double) session.getAttribute("amount");  //!!! Ta request diavazoun name tis html -- diavazw apo to session
		//	double amount = Double.parseDouble(am);
//			String quant = request.getParameter("quantity");
//			int quantity = Integer.parseInt(quant);
//			String usid = request.getParameter("user_id");
//			int user_id = Integer.parseInt(usid);
			System.out.println("ok1");
			
			Basket basket = (Basket)session.getAttribute("cart-object");
			System.out.println("eimai sto create order. tipwse to size toy basket  "+ basket.size());
			int quantity = basket.size();
			System.out.println("eimai sto create order. tipwse to quantity  "+ quantity);
			Buyer buyer1 = (Buyer)session.getAttribute("user-object");
			int user_id= buyer1.getUser_id();
			System.out.println("ok2");
			
			Order ord = new Order(amount, quantity, new Date(), user_id);
			System.out.println("ok3");
			OrderDAO odao = new OrderDAO();

			odao.open(); // open connection
			System.out.println("ok4");
			int order_id = odao.insertOrder(ord); 
			System.out.println("insertOrderOK");
			
			for (int i=0; i<basket.size();i++){
				odao.insertOrderProduct(order_id, basket.get(i).getProduct_id());
				
			}
			System.out.println("insertOrderProductsOK");
			odao.close(); // close connection
			session.setAttribute("message", "Your order has been succesfully submited!");
			
			System.out.println("setAttributeOK");
			succdis.forward(request, response);
			return;

		} catch (Exception e) {
			
			request.setAttribute("errormessage", e.getMessage());
			
			errodis.forward(request, response);	
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
