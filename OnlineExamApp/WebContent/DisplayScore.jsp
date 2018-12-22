<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ page import="java.util.List" %>
 <%@ page import="java.util.Iterator" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html><head>
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


     
     List scorelist=(List)session.getAttribute("scorelist"); 
     Iterator itr=scorelist.iterator();
    
%>
<table border='1' width='100%'>
<tr><th>Name</th><th>Marks Scored</th><th>Status</th><th>Dated</th><th>Domain</th></tr>
<%
while(itr.hasNext())
		{%><tr><td><%=itr.next() %></td><td><%=itr.next() %></td><td><%=itr.next()%></td><td><%=itr.next()%></td><td><%=itr.next() %></tr>
<%} %>
<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						Candidates Mark list
					</h1>
					<ol class="breadcrumb">
						<li>
							<a href="DeleteAll">Clear ScoreBoard</a>
						</li>
					</ol>
				</div>
			</div>
</table>
<%-- <c:forEach items="${list}" var="e" varStatus="status">
<tr><td>${e}</td><td>${e}</td><td>${e}</td></tr>
</c:forEach>
 --%></body>
 <div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>
	
</html>