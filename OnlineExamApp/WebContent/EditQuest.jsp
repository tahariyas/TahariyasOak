<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="onlineexam.Bean2" %>
    
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
				<form class="navbar-form navbar-right">

				<div class="input-group">

					<font size="5" color="Orange"><i class="fa fa-address-card-o"></i><a href="SelectView.jsp">Back</a></font>
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


	
Bean2 e=(Bean2)session.getAttribute("list");
String vf=(String)request.getAttribute("vf");
%>


<form action="UpdateQnServ" method="get">
		<center><table>
		<tr><td><input type="hidden" name="vf1" value=<%=vf%>></td></tr>
		<tr><td><input type="hidden" name="id" value="<%=e.getId() %>"></td></tr>
		<tr><td><h3>Select Domain:</h3></td><td><select name="dom">
		<option><%=e.getDom() %></option>
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
		<tr><td><h4>Enter Question</h4></td></tr>
		<tr><td><input type="text" name="qn" value="<%=e.getQuest() %>"></td></tr>
		<tr><td><h4>Enter Option A</h4></td>
		<td><input type="text" name="a" value="<%=e.getO1() %>"></td>
		<td><h4>Enter Option B&nbsp;&nbsp;&nbsp;</h4></td>
		<td><input type="text" name="b" value="<%=e.getO2()%>"></td></tr>
		<tr><td><h4>Enter Option C</h4></td>
		<td><input type="text" name="c" value="<%=e.getO3() %>"></td>
		<td><h4>Enter Option D&nbsp;&nbsp;&nbsp;</h4></td>
		<td><input type="text" name="d" value="<%=e.getO4()%>"></td></tr>
		<tr><td><h4>Enter Correct Answer</h4></td></tr>
		<tr><td><input type="text" name="ans" value="<%=e.getAns()%>"></td></tr><br>
		</table><br>
		<div class="btn-group btn-group-sm"><input class="btn btn-default btn-block btn-info" type="submit" value="Edit&Save"></div>
		</center>
		</form>
</body>
<div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>

</html>