package com.arthouse.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arthouse.dao.BuyerDAO;
import com.arthouse.domain.Basket;
import com.arthouse.domain.Buyer;
import com.arthouse.domain.Product;

/**
 * Servlet implementation class LoginBuyerController
 */
@WebServlet("/loginBuyer")
public class LoginBuyerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginBuyerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		RequestDispatcher loginfail = getServletContext().getRequestDispatcher("/loginbuyer.jsp");
		RequestDispatcher loginsuccess = getServletContext().getRequestDispatcher("/buyer_ratedprod.jsp");
		
		try {
			
			BuyerDAO bdao = new BuyerDAO();
			bdao.open();
			Buyer buyer1 = bdao.authenticateBuyer(username, password);
			bdao.close();
			HttpSession session = request.getSession(true);
			session.setAttribute("user-object", buyer1);
			Basket basket = new Basket();
			session.setAttribute("cart-object", basket);
			session.setAttribute("userid", "buyer");
			
			loginsuccess.forward(request, response);
			
		} catch (Exception e) {
			
			request.setAttribute("msg", "Wrong inputs.Please enter again username and password");
			loginfail.forward(request, response);
			
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
