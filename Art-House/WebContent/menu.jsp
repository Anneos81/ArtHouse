<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.arthouse.dao.ProductDAO"%>
<%@ page import="com.arthouse.domain.*"%>
<%@ page import="java.util.*"%>
	
	
		<%
		String orderByParam = request.getParameter("orderby");//πραγματοποιηση request για το orderby
		String categoryParam = request.getParameter("category");//πραγματοποιηση request για κατηγορία
		String searchByParam = request.getParameter("search");//πραγματοποιηση request για το search
		System.out.println(searchByParam + " categoty " +categoryParam );
		ProductDAO dao = new ProductDAO();// φτιάχνω αντικείμενο dao της ProductDAO
		dao.open();//και με αυτό ανοίγω την σύνδεση με την βάση μέσω της μεθόδου open της ProductDAO

		List<String> cList = dao.getAllCategories();//φτιάχνω μία λίστα που έχει String με αντικείμενο το cList
		//και δέχεται όλες τις κατηγορίες μέσω της μεθόδου getAllCategories()
		List<Product> pList = new ArrayList<Product>();//φτιάχνω μία λίστα που έχει Product με αντικείμενο το pList

		if (orderByParam != null) {//για να μην φέρνει όλα τα προιόντα, αλλά μόνο αυτά με orderby
			if (orderByParam.equals("price")) {
				pList = dao.getProductsOrderedByPrice();//μου φέρνει τα προιόντα ταξινομημένα κατά τιμή
			}

			if (orderByParam.equals("score")) {
				pList = dao.getProductsWithRating();//μου φέρνει τα προιόντα ταξινομημένα κατά βαθμολογία
			}
		} else if (categoryParam != null) {//αντίστοιχα για να χω κατηγορία
			pList = dao.getProductsByCategory(categoryParam);
		} else if (searchByParam != null) {//αντίστοιχα για να γίνει αναζήτηση
			pList = dao.searchProductsByTitle(searchByParam);
		} else {
			pList = dao.getProducts();// τελευταία περίπτωση αν δεν έχει ζητήσει ο χρήστης κάποια κατηγορία
			//ή κάποιο orderby τα φέρνει όλα - 
		}
		dao.close();
	%>
	   
                <form action="homepage.jsp" method="get">
	                <div class="input-group">
					  <input type="text" class="form-control" name="search" placeholder="Search for painting...">
	                    <span class="input-group-btn">
	                        <button class="btn btn-default" type="submit">Go!</button>
	                    </span>
	                </div>
                </form><br>
                <div class="dropdown">
                  <button type="button" class="list-group-item btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Categories
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                      <%
							for (String c : cList) {//παίρνω λίστα με κάθε υποκατηγορία
						%>
						<li><a href="homepage.jsp?category=<%=c%>"><%=c%></a></li>
						<%
							}
						%>
                    </ul>
                  </div>
                <div class="dropdown">
                  <button type="button" class="list-group-item list-group-item-action dropdown-toggle" data-toggle="dropdown">Order By
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                      <li><a href="homepage.jsp?orderby=price">Price</a></li>
					  <li><a href="homepage.jsp?orderby=score">Rate</a></li>
                    </ul>
                  </div>
