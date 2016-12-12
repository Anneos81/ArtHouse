package com.arthouse.controllers;

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

import com.arthouse.domain.*;
import com.arthouse.dao.*;


@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215)
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Parameter names
	private static final String PROFILE_IMAGE = "image";
	private static final String NAME = "name";
	// The upload location
	private static final String UPLOAD_LOCATION = "images"; 
	
    public UploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String title = request.getParameter("ptitle");
		System.out.println("request price"+  request.getParameter("pprice"));
		String pr = request.getParameter("pprice");
		int price = Integer.parseInt(pr);
		String category = request.getParameter("pcategory");
		String dimensions = request.getParameter("pdimensions");
		String description = request.getParameter("pdescription");
		
		//define RequestDispatcher object to forward any errors
		RequestDispatcher errodis = getServletContext().getRequestDispatcher("/errorpage.jsp");
		
		//define RequestDispatcher object to forward if data are correct and successfully stored in database
		RequestDispatcher succdis = getServletContext().getRequestDispatcher("/profileseller.jsp");
		
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

		try (InputStream input = imagePart.getInputStream()) {
			Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			String picture = uploadFileName;
			System.out.println("picture"+picture);
			
			
			Product product = new Product(sellerid , title, price, description,
					dimensions, category, picture);

			ProductDAO pro = new ProductDAO();
			
			pro.open(); // open connection	
			pro.uploadProduct(product); //store product to database
			pro.close(); // close connection

			//request.setAttribute("product", product); //adding Product object to request

			succdis.forward(request, response);
			return;
			

		} catch (Exception e) {
			
			request.setAttribute("errormessage", e.getMessage());
			
			errodis.forward(request, response);	
		}
	}
	

}
