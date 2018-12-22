<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="onlineexam.Bean1" %> 
 
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
    <jsp:include page="header.jsp"></jsp:include>

<%           

 session=request.getSession(false);
 
 if(session.getAttribute("name")==null)
{  
    
	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	rd.forward(request,response);
	
}
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

 String name1 = (String) session.getAttribute("name");


%>
 
 <div class="container">
<form action="EditServlet2" onsubmit="return validate()" method="post" enctype="multipart/form-data">
<h1 class="text-center">
				<span class="fa fa-user">UpdateProfile</span>
			</h1>

<div class="col-md-push-4 col-md-4 jumbotron">
<center>
<table>    
<%Bean1 e=(Bean1)session.getAttribute("Bean");%>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="name" value="<%=e.getName() %>" readonly="readonly">
					</div>
				</div>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="password" name="pass1" value="<%=e.getPass2() %>" required="required">
					</div>
				</div>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="password" name="pass2" value="<%=e.getPass2() %>">
					</div>
				</div>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="email" name="email" value="<%=e.getEmail() %>" readonly="readonly">
					</div>
				</div>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="mob" value="<%=e.getMob() %>" readonly="readonly">
					</div>
				</div>
<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="yop" value="<%=e.getYop() %>">
					</div>
				</div>
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="aadhar" value="<%=e.getAadhar() %>">
					</div>
				</div>
				
<%-- 
<tr><td>Username</td><td>:<input type="text" name="name" value="<%=e.getName() %>" readonly="readonly"></td></tr>
<tr><td>Password</td><td>:<input type="password" name="pass1" value="<%=e.getPass2() %>"></td></tr>
<tr><td>Confirm Password</td><td>:<input type="password" name="pass2" value="<%=e.getPass2() %>"></td></tr>
<tr><td>Email:</td><td>:<input type="email" name="email" value="<%=e.getEmail() %>" readonly="readonly"></td></tr>
<tr><td>Mobile no.</td><td>:<input type="text" name="mob" value="<%=e.getMob() %>" readonly="readonly"></td></tr>
<tr><td>Year of Passout</td><td>:<input type="text" name="yop" value="<%=e.getYop() %>"></td></tr> --%>

	<br /> 
<input class="btn btn-default  btn-info" type="submit" value="Update"></div></td></tr>
</table>
</center>

</div>
</form>
</div>
<script>
function validate()

{
	var u=document.getElementsByName("name")[0].value;
    var p1=document.getElementsByName("pass1")[0].value;
	var p2=document.getElementsByName("pass2")[0].value;
	var e=document.getElementsByName("email")[0].value;
	var mob=document.getElementsByName("mob")[0].value;
	var yop=document.getElementsByName("yop")[0].value;
//	var dob=document.getElementsByName("dob")[0].value;
//	var aadhar=document.getElementsByName("aadhar")[0].value;
    var atposition=e.indexOf("@");
	var dotposition=e.lastIndexOf("."); 
	var year=new Date().getFullYear();
	var allowedFiles = [".doc", ".docx", ".pdf"];
    var fileUpload = document.getElementById("fileUpload");
    var regex = new RegExp("([a-zA-Z0-9()\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
	if(u==null||u=="")
	{
		alert("Name can't be blank");  
		return false;
	}
	else if(p1.length<6)
	{
		alert("Password must be at least 6 characters long.");  
		return false;
	}
	
	else if(p2==null||p2==""||p1!=p2)
	{
		alert("Passwords donot match");  
		return false;
	}
	 else if (atposition<1||dotposition<atposition+2 ||dotposition+2>=e.length)
	{  
		 alert("Please enter a valid e-mail address");  
		 return false;  
	}
	else if(mob.length!=10||mob[0]==0||mob==null||mob=="")
	{
		alert("Please enter a valid mobile number");  
		return false;  
	}
	else if(yop==null||yop==""||yop[0]!=2||yop.length!=4||yop>year )
	{
		alert("Year of passout is not valid");  
		return false;
	} 
	else if(isNaN((new Date(dob)).getTime()))
	{
		alert("invalid date of birth");
		return false;
	}
	else if(isNaN(aadhar)||aadhar.length!=12||aadhar==null||aadhar=="")
	{
		alert("please check aadhar number");  
		return false;
	}
	else
		return true;
	 
}
</script>
</body>
<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>
</html>