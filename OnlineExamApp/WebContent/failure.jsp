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
<script src="js/login.js"></script>


</head>
 
<body>

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
								
			</nav>
			<script type="text/javascript">
function validate(){
var username = document.getElementById("username").value;
var password = document.getElementById("password").value;
if ( username == "lohith" && password == "123456"){
alert ("Login successfully");
window.location = "success.html"; // Redirecting to other page.
return false;
}
else{
attempt --;// Decrementing by one.
alert("You have left "+attempt+" attempt;");
// Disabling fields after 3 attempts.
if( attempt == 0){
document.getElementById("username").disabled = true;
document.getElementById("password").disabled = true;
document.getElementById("submit").disabled = true;
return false;
}
}
}
</script>
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
<div id="login">
        
        <div align="center">
<div class="container">
			<form  action="LoginServlet" method=post>
			<h1 class="text-center">
				<span class="fa  fa-user">Login</span>
			</h1>
			<div class="col-md-push-4 col-md-4 jumbotron">
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="name" placeholder=username required
							autofocus="autofocus">
					</div>
				</div>
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="password" name="pass" placeholder=password required
							autofocus="autofocus">
					</div>
				</div>	
				<div class="form-group" align="center">
					<br /> 
					<input class="btn btn-default btn-block btn-info" type="submit" value="login"  id='login-form' onclick="return validate()">
				</div>
				 <p class="message" ><a href="Reg.jsp">Don't have an account?</a></p>
			<div>
			<font size="2" color="red">Invalid UserName Or Password</font>
			</div>
			</div>
			
		</form>

</div>
</body>

<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>

</html>