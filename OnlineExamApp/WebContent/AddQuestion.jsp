<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>wexos</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/simple-sidebar.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<nav class="js-mega-menu navbar navbar-expand-lg">
 			<form class="navbar-form navbar-left">

 				       
           <a href="#"><img class="img-responsive2"       
           src="img/wexos.png"></a>
									</form>       

				<div class="navbar-header">
					<a href="" id="menu-toggle"><button type="button"
							class="hamburger is-closed" data-toggle="offcanvas"></button> </a>
					<h1 class="hair">
					<font size="6" color="black">	WEXOS TALENT</font><span>ACQUISITION</span>
					</h1>
				</div>
				<form class="navbar-form navbar-right">

				<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-address-card-o"></i><a href="AdminLogin.jsp">Back</a></font>
				</div>
				<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-sign-in"></i><a href="LogOut">Logout</a></font>
				</div>
				
			</form>
				
								
			</nav>
    <jsp:include page="header.jsp"></jsp:include>

<%                                    
 session=request.getSession(false);
 if(session.getAttribute("name")==null)
{  
    
	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	rd.forward(request,response);
	
}
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

%>

<table cellpadding="10">
<form action="SaveQnServlet" method=post>
<tr><td><h3>Select Domain:</h3></td><td><select name="dom" >
<option>Java</option>
<option>.Net</option>
<option>Hadoop</option>
<option>Testing</option>
<option>Android</option>
<option>SAP</option>
<option>DigitalMarketing</option>
<option>PHP</option><br>
</select>
</td></tr>
  
                       
                
                <tr>
                    <td><b>Question:</b></td>
                    <td><textarea rows="10" cols="100" name="qn" required></textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="50" name="o1" required></textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="50" name="o2" required></textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="50" name="o3" required></textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="50" name="o4" required></textarea></td>
                </tr>
                <tr><td><h4>Enter Correct Answer</h4></td></tr>
				<tr><td><input type="text" name="a1"></td></tr><br>
<tr><td><input type="submit" value="Submit"></td></tr>
</form>
</table>

</body>
<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>

</html>