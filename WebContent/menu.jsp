<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.arthouse.dao.ProductDAO"%>
<%@ page import="com.arthouse.domain.*"%>
<%@ page import="java.util.*"%>
<%
	int pageNum = 1;

	try {
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException e) {
	}

	String orderByParam = request.getParameter("orderby");
	String categoryParam = request.getParameter("category");
	String searchByParam = request.getParameter("search");

	ProductDAO dao = new ProductDAO();

	dao.open();

	int maxProducts = 0;
	
	List<String> cList = dao.getAllCategories(); 
//			new ArrayList<>();
	//cList.add("Land"); cList.add("Photography");cList.add("Figure");cList.add("Abstract");
	//cList.add("Portrait");cList.add("Modern");cList.add("Emotion");cList.add("Decorative");
	//pdao.getAllCategories();

	
	
	List<Product> pList = new ArrayList<Product>();
	Utilities util = new Utilities();
	
	if (orderByParam != null) {
		if (orderByParam.equals("price")) {
			pList = dao.getProductsOrderedByPrice(pageNum);
		}

		if (orderByParam.equals("score")) {
			pList = dao.getProductsWithRating(pageNum);
		}
		maxProducts = dao.countProducts();
	} else if (categoryParam != null) {
		pList = dao.getProductsByCategory(categoryParam, pageNum);
		maxProducts = dao.countProductsByCategory(categoryParam);
	} else if (searchByParam != null) {
		pList = dao.searchProductsByTitle(searchByParam, pageNum);
		maxProducts = dao.countProductsBySearch(searchByParam);
	} else {

		maxProducts = dao.countProducts();
		pList = dao.getProductsByPage(pageNum);

	}
	dao.close();
%>

<form action="homepage.jsp" method="get">
	<div class="input-group">
		<input type="text" class="form-control" name="search"
			placeholder="Search for painting..."> <span
			class="input-group-btn">
			<button class="btn btn-default" type="submit">Go!</button>
		</span>
	</div>
</form>
<br>
<div class="dropdown">
	<button type="button"
		class="list-group-item btn btn-default dropdown-toggle"
		data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		Categories <span class="caret"></span>
	</button>
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
	<button type="button"
		class="list-group-item list-group-item-action dropdown-toggle"
		data-toggle="dropdown">
		Order By <span class="caret"></span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="homepage.jsp?orderby=price">Price</a></li>
		<li><a href="homepage.jsp?orderby=score">Rate</a></li>
	</ul>
</div>
