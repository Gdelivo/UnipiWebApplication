<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="mainPackage.*" %>
<%
    String user = request.getParameter("amka_");    
    String pwd = request.getParameter("pass_");
    
    if(user != null || pwd != null ){ 
        DatabaseConnection db = new DatabaseConnection();
        db.open();
        db.createUser(user,pwd);
        session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
    }


%>