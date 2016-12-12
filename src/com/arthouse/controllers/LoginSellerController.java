package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.arthouse.dao.SellerDAO;
import com.arthouse.domain.Seller;

/**
 * Servlet implementation class LoginSellerController
 */
@WebServlet("/loginSeller")
public class LoginSellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSellerController() {
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
		RequestDispatcher loginfail = getServletContext().getRequestDispatcher("/loginseller.jsp");
		RequestDispatcher loginsuccess = getServletContext().getRequestDispatcher("/profileseller.jsp");
		
		try {
			
			SellerDAO sdao = new SellerDAO();
			sdao.open();
			Seller seller1 = sdao.authenticateSeller(username, password);
			sdao.close();

			HttpSession session = request.getSession();
			if (session == null) {
			    System.out.println("keno session");
			} else {
				System.out.println("session ok!");
			} 
			 session = request.getSession(true);
			session.setAttribute("user-object", seller1);
			session.setAttribute("userid", "seller");
			
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
