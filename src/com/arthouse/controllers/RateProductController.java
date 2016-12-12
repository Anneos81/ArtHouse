package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;



import com.arthouse.dao.RatingDAO;

import com.arthouse.domain.Buyer;

import com.arthouse.domain.Rating;

/**

 * Servlet implementation class RateProductController

 */

@WebServlet("/rate")

public class RateProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

    public RateProductController() {

        super();

        // TODO Auto-generated constructor stub

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		try {  

			HttpSession session = request.getSession(true);

			Buyer user = (Buyer)session.getAttribute("user-object");



			if(user == null) 

				throw new Exception("not logged in");

			

			Rating rating = new Rating(user.getUser_id(), 

					Integer.parseInt(request.getParameter("product")), 

					Integer.parseInt(request.getParameter("rating")));

	

			RatingDAO rdao = new RatingDAO();

			rdao.open();

			

			rdao.addRating(rating);

			

			rdao.close();

			

			//response.setContentType("text/html; charset=UTF-8"); 

			//response.setStatus(200);

	   	} catch (Exception e) {

	   		throw new ServletException(e);

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