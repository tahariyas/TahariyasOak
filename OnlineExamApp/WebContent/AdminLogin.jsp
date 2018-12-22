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


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
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
					<font size="6" color="black">	WEXOS TALENT</font><span>ACQUISITION</span>
					</h1>
				</div>
				<form class="navbar-form navbar-right">

								<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-sign-in"></i><a href="LogOut">Logout</a></font>
				</div>
				
			</form>
				
								
			</nav>
   <section class="g-flex-centered g-bg-pos-center g-bg-img-hero g-py-150" style="background-image: url(img/i.jpg); height: calc(30vh - 13px);">
   <div class="container text-center g-z-index-1">
   <center><h1><font size="5" color="violet">WEXOS</font><font size="5" color="orange">INFORMATICA</font></h1></center>
 <!--   <span> <h3><marquee>Welcome to the wexos talent Acquisition</marquee></h3></span> -->
  <h3><marquee> <font size="6" color="red">Welcome Admin</font></marquee></h3>
    </div>
    </section>
<hr/>


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
<div class="container">
			<div class="col-md-3 col-offset-1">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h4>
							<span class="glyphicon glyphicon-filter">AdminOperation</span>
						</h4>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<h4>
							<span class="glyphicon glyphicon-pencil"></span><font size="4" color="Green">SELECT To VIEW</font>


							</h4>
							<div class="btn-group btn-group-sm">
   <label for="2"><span class="glyphicon glyphicon-arrow-right"></span><button type="button" onclick="location = 'AddQuestion.jsp'">Add Questions</button></label></div></li>
<div class="btn-group btn-group-sm">
   <label for="2"><span class="glyphicon glyphicon-arrow-right"></span><button type="button" onclick="location = 'SelectView.jsp'">View Questions</button></label></div></li>
<div class="btn-group btn-group-sm">
   <label for="2"><span class="glyphicon glyphicon-arrow-right"></span><button type="button" onclick="location = 'CandiViewServ'">View Candidates</button></label></div></li>
<div class="btn-group btn-group-sm">
   <label for="2"><span class="glyphicon glyphicon-arrow-right"></span><button type="button" onclick="location = 'ScoreServ'">View ScoreBoard</button></label></div></li>
						
							
							
						</div>
					</div>
				</div>
			</div>
 <div
			class="breakout offset-inside-2 medium-offset-inside-3 large-offset-inside-5">
			<div class="row">
				<div class="column">
					<section class="text-center">
						<div class="breakout__text-wrap">
							<div class="text-info">
								<h2>Fun &amp; easy test maker</h2>
							</div>
							<p class="text-primary">
							<i class="glyphicon glyphicon-arrow-right"></i>The administrator has the full fledged rights over the System
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Can create/delete an account
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Can view the accounts
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Can change the password
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Can hide any kind of features from the both of users
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Insert/delete/edit the information of available on System
							<br>
							<i class="glyphicon glyphicon-arrow-right"></i>Can access all the accounts of the faculty members/students
							</p>
						</div>
					</section>
				</div>
			</div>
		</div>
 
   </div>

</div>
</body>
<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>

</html>