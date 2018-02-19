<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form action="index.jsp" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
            </div>
        
            <div class="field-wrap">
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Α.Μ.Κ.Α<span class="req">*</span>
            </label>
            <input type="text" name="amka_"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              ΚΩΔΙΚΟΣ<span class="req">*</span>
            </label>
            <input type="password" name="pass_" required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="index.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              Α.Μ.Κ.Α<span class="req">*</span>
            </label>
            <input type="text"required name="lamka_" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required name="lpass_" autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>
    

</body>

</html>


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
    
    String luser = request.getParameter("lamka_");    
    String lpwd = request.getParameter("lpass_");
    
    if(luser != null || lpwd != null ){ 
        DatabaseConnection db = new DatabaseConnection();
        db.open();
        db.userLogIn(luser,lpwd);
        session.setAttribute("luser", luser);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    }
%>


