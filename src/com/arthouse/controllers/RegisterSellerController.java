package com.arthouse.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.arthouse.dao.SellerDAO;
import com.arthouse.domain.Seller;


/**
 * Servlet implementation class RegisterSellerController
 */
@WebServlet("/registerSeller")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterSellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// Parameter names
	private static final String PROFILE_IMAGE = "image";
	private static final String NAME = "name";
	// The upload location
	private static final String UPLOAD_LOCATION = "images"; 
	
	
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		//reading parameters from request
		String firstname = request.getParameter("firstname");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");	

		String name = request.getParameter(NAME);
		System.out.println("NAME: "+ name);
		// Obtain the upload file part in this multipart request
		Part imagePart = request.getPart(PROFILE_IMAGE);
		System.out.println("imagepart "+ imagePart);
		// Get the content type
		String contentType = imagePart.getContentType();
		// Get the absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");
		System.out.println("path"+ appPath);
		// Construct path of the directory to save uploaded files
		String savePath = appPath + File.separator + UPLOAD_LOCATION;
		// Define the path to the final storage location
		File uploadFile = new File(savePath);
		if (!uploadFile.exists()) {
			uploadFile.mkdir();
		}
		contentType = "." + imagePart.getContentType().split("/")[1];
		String uploadFileName = name + contentType;
		File file = new File(uploadFile, uploadFileName);
		System.out.println("file"+file);
				
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/loginSeller");

		try (InputStream input = imagePart.getInputStream()) {
			Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			String photo = uploadFileName;
			System.out.println("picture"+ photo);
			

			Seller sellero = new Seller(username, password, firstname, surname, email, photo);

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}