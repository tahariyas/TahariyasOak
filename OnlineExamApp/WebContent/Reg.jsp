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
    <jsp:include page="header.jsp"></jsp:include>
<% 


session=request.getSession(false);
String userMsg=(String)session.getAttribute("userMsg");
String flag=(String)session.getAttribute("flag");
if(userMsg!=null&&flag!="set")
{
	 
}

else
{
	 if(userMsg!=null)
	 { 
		 out.print("<font color='red'>"+userMsg+"</font>");
		
	 }
	 userMsg=" ";
	
}


String userMsg1=(String)session.getAttribute("userMsg1");
String flag1=(String)session.getAttribute("flag1");
if(userMsg1!=null&&flag1!="set")
{
	
}

else
{
	 if(userMsg1!=null)
	 {   
		 out.print("<font color='red'>"+userMsg1+"</font>");
		
	 }
	 userMsg1=" ";
	
}


String userMsg2=(String)session.getAttribute("userMsg2");
String flag2=(String)session.getAttribute("flag2");

if(userMsg2!=null&&flag2!="set")
{
	
}

else
{
	 if(userMsg2!=null)
	 {   
		 out.print("<font color='red'>"+userMsg2+"</font>");
		
	 }
	 userMsg2=" ";
	
}
	

 
 %>

<div class="container">
			<form class="reg-form" action="RegServ" onsubmit="return validate()" method="post" enctype="multipart/form-data">
			<h1 class="text-center">
				<span class="fa fa-user">SignUp</span>
			</h1>
			<div class="col-md-push-4 col-md-4 jumbotron">
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="name" placeholder=Username onchange="check()" required
							autofocus="autofocus" value=<%=userMsg %>>
					</div>
				</div>
					<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="mob" placeholder=MobileNumber onchange="checkMob()" required
							autofocus="autofocus" value=<%=userMsg2 %> >
					</div>
				</div>
				
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="email" placeholder=Email onchange="checkEmail()" required
							autofocus="autofocus" value=<%=userMsg1 %>>
					</div>
				</div>
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="password" name="pass1" placeholder=Password required
							autofocus="autofocus">
					</div>
				</div>
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="password" name="pass2" placeholder=ConfirmPassword required
							autofocus="autofocus">
					</div>
				</div>
				
				
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="yop" placeholder=YearOfPassout required
							autofocus="autofocus">
					</div>
				</div>
				
				<div class="form-group" align="center">
					<div>
						<input class="form-control" type="text" name="aadhar" size="50" placeholder=Aadhar required
							autofocus="autofocus">
					</div>
				</div>
					
				Upload Resume
				<input type="file" name="resume" size="50" accept="application/pdf,application/msword,
  				application/vnd.openxmlformats-officedocument.wordprocessingml.document">
				<div class="form-group" align="center">
					<br /> 
					<input class="btn btn-default btn-block btn-info" type=submit value=Register id='login-form'>
				</div>
				<center><p class="message" ><a href="login.jsp">Have an account Sign In</a></p></center> 
			</div>
		</form>

</div>

<script>
function check()
{//alert("hi");
var n=document.getElementsByName("name")[0].value;
document.location.href='CheckServ?user='+n;
}

function checkEmail()
{//alert("hi");
var n=document.getElementsByName("email")[0].value;
document.location.href='CheckServEmail?user='+n;
}
function checkMob()
{
var n=document.getElementsByName("mob")[0].value;
document.location.href='CheckServMob?user='+n;
}

function validate()

{
	var u=document.getElementsByName("name")[0].value;
    var p1=document.getElementsByName("pass1")[0].value;
	var p2=document.getElementsByName("pass2")[0].value;
	var e=document.getElementsByName("email")[0].value;
	var mob=document.getElementsByName("mob")[0].value;
	var yop=document.getElementsByName("yop")[0].value;
	//var dob=document.getElementsByName("dob")[0].value;
	var aadhar=document.getElementsByName("aadhar")[0].value;
	//var pan=document.getElementsByName("pan")[0].value;
    var atposition=e.indexOf("@");
	var dotposition=e.lastIndexOf("."); 
	var year=new Date().getFullYear();
	var allowedFiles = [".doc", ".docx", ".pdf"];
    var fileUpload = document.getElementById("fileUpload");
    var regex = new RegExp("([a-zA-Z0-9()\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
	if(u==null||u==""||)
	{
		alert("Name can't be Special Characters");  
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
	/* else if(pan= /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/||pan.length!=11||pan==null||pan=="")
		{
		   alert("please enter valid pan");
		   return false;
		} */
	else if (!regex.test(fileUpload.value.toLowerCase())) 
	{
       alert("File format doesnot support. Please upload .doc,.docx or .pdf file for resume");
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