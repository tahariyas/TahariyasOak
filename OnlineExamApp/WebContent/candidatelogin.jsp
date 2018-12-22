<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
%>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Login</title>
</head>
<body>

	
<%                                    
 session=request.getSession(false);
 
 if(session.getAttribute("name")==null)
{  
	
	 RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		rd.forward(request,response);
	
}
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");


%>
<nav class="js-mega-menu navbar navbar-expand-lg">
 			<!-- <a href="index.html" class="navbar-brand">
              <img src="img/wexos.png" alt="WEXOS LOGO">
            </a> -->
<form class="navbar-form navbar-left">

 				       
           <a href="#"><img class="img-responsive2"       
           src="img/wexos.png"></a>
									</form>       

				<div class="navbar-header">
					<a href="" id="menu-toggle"><button type="button"
							class="hamburger is-closed" data-toggle="offcanvas"></button> </a>
					<h1 class="hair">
		
					<font size="6" color="black">WEXOS TALENT</font><span>ACQUISITION</span>
					</h1>
				</div>
				<form class="navbar-form navbar-right">

				<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-address-card-o"></i><a href="EditAdmServ">EditProfile</a></font>
				</div>
				<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-sign-in"></i><a href="LogOut">Logout</a></font>
				</div>
				
			</form>
				
			</nav>
    <jsp:include page="header.jsp"></jsp:include>


		

	



<center>
<font size="5" color="LightBlue"><h1><marquee>INSTRUCTIONS</marquee></h1></font>
   
    <ul>
	  <h4>Total Questions:20</h4>
	  <h4>Time Alloted: 20 Minutes</h4>
	  <h4>Questions based on java,testing,android,webDesigning and pHP</h4>
	  <h4>There is no negative marking</h4>
	  <h4>Make sure to select your technology which u are in confident</h4>
	  <h4>Click on <b>Start</b> button to start the test</h4>
	 <font size="5" color="Red"> <h4>After the test starts, don't press back or refresh button or don't close the browser window</h4></font>
	</ul>  
	<br/>
	<br/>
<form action="testPageServ">
Select domain:
<select name="dom">
<option>Java</option>
<option>.Net</option>
<option>Hadoop</option>
<option>Testing</option>
<option>Android</option>
<option>SAP</option>
<option>DigitalMarketing</option>
<option>PHP</option>
</select><br>
<br>
<input class="btn btn-primary" type ="submit" value="Take Test" style="font-color:white;background-color:green">
</form>
</center>

</body>
<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>

</html>