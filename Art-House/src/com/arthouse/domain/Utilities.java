package com.arthouse.domain;

import java.net.URI;

import javax.servlet.http.HttpServletRequest;

public class Utilities {
	public String appendUri(HttpServletRequest request, String appendQuery) {
		try {		
			String queryString = request.getQueryString();
			
			if(queryString.contains("page=")) {
				queryString = queryString.replaceAll("page=\\d", appendQuery);
				
				return request.getRequestURL().append('?').append(queryString).toString();
			}
			
			URI oldUri = new URI(request.getRequestURL().append('?').append(request.getQueryString()).toString());

	        String newQuery = oldUri.getQuery();
	        if (newQuery == null) {
	            newQuery = appendQuery;
	        } else {
	            newQuery += "&" + appendQuery;  
	        }

	        URI newUri = new URI(oldUri.getScheme(), oldUri.getAuthority(),
	                oldUri.getPath(), newQuery, oldUri.getFragment());

	        return newUri.toString();
		} catch(Exception ex) {
			return request.getRequestURL().append('?').append(appendQuery).toString();
		}        
    }
}
