package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arthouse.dao.SellerDAO;
import com.arthouse.domain.Seller;


/**
 * Servlet implementation class RegisterSellerController
 */
@WebServlet("/registerSeller")
public class RegisterSellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSellerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//reading parameters from request
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone2 = request.getParameter("phone");
		int phone = Integer.parseInt(phone2);
		String address = request.getParameter("address");
		String town = request.getParameter("town");
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		String photo = request.getParameter("photo");	
		
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/loginSeller");

		try {

			Seller sellero = new Seller(username, password, name, surname, email, phone, town, address, photo);

			SellerDAO sdao = new SellerDAO();

			sdao.open(); // open connection

			sdao.registerSeller(sellero); 
			sdao.close(); // close connection

			//request.setAttribute("buyerobj", buyero); 
			request.setAttribute("username", username);
			request.setAttribute("password", password);

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
