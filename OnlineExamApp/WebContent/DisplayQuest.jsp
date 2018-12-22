<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="onlineexam.Bean2" %>
     <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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

    <script>
     
    if(localStorage.getItem("min")<0||localStorage.getItem("min")=="NaN"||localStorage.getItem("min")==null)
    	{
      var min = 5;
      localStorage.setItem("min",min);
      var sec = 00;
      localStorage.setItem("sec", sec);
     
    	}
    
	
    function f3()
    {
    	localStorage.setItem("min",-1);
    }
      function f2()
      {
           if (parseInt(localStorage.getItem("sec")) > 0)
           {
                sec = parseInt(localStorage.getItem("sec")) - 1;
                localStorage.setItem("sec", sec);
                 document.getElementById("showtime").innerHTML = "Your Left Time  is :"+localStorage.getItem("min")+" Minutes ," + localStorage.getItem("sec")+" Seconds";
                tim = setTimeout("f2()", 300);
           }
           else
           {
                if (parseInt(localStorage.getItem("sec")) == 0)
                {
                	min = parseInt(localStorage.getItem("min")) - 1;
                	localStorage.setItem("min", min);
                    if (parseInt(localStorage.getItem("min"))< 0)
                    {  
                        document.test.submit();
                    }
                    else
                    {
                        sec = 60;
                        localStorage.setItem("sec", sec);
                        document.getElementById("showtime").innerHTML = "Your Left Time  is :" + localStorage.getItem("min") + " Minutes ," + localStorage.getItem("sec") + " Seconds";
                        tim = setTimeout("f2()", 300);
                    }
                }
               
            }
        }

     </script>
    </head>

    
<body onload="f2()">
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
		rd.forward(request, response);
    }
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
    <div class="container"> 
    <form action="CalculateServ" method="post" name='test'>
    <div>
   <table width="100%" align="center">
   <tr>
   <td>
    <font color="Red">
   <div id="starttime"></div><br />
           <div id="endtime"></div><br />
           <div id="showtime"></div>
           
    </font>
           </td></tr>
   <tr><td><br /></td></tr>
    </table><br />
</div>

    
 <% 
   ArrayList list1=new ArrayList();
    List<Bean2> list=(List<Bean2>)session.getAttribute("list");
    int x,i,pageStart=0,count=0;
    String set;
    
    set=(String)request.getAttribute("flag");
   
    if(request.getAttribute("count")!=null)
    {count=(int)request.getAttribute("count");}
    
    if(request.getAttribute("pageStart")!=null)
    {pageStart = (int)request.getAttribute("pageStart");}
  
    %>
     <input type="hidden" name="set" value=<%=set %>>
    <input type="hidden" name="count" value=<%=count %>>
    <input type="hidden" name="pageStart" value=<%=pageStart+1 %>>
    
   <% 
    for(x=pageStart;x<list.size()&& x< pageStart +1;x++)
    {
    %>

    <font size="4" color="Green"><tr><td><%= pageStart+1%>.<%out.println(list.get(x).getQuest());%></td></tr> <br></font>
    <hr>
  <input type="radio" name="option<%=list.get(x).getId() %>" value="<%=list.get(x).getO1() %>"  /><%=list.get(x).getO1() %><br><br></font> 
  <input type="radio" name="option<%=list.get(x).getId() %>" value="<%=list.get(x).getO2() %>" /><%=list.get(x).getO2() %><br><br> 
  <input type="radio" name="option<%=list.get(x).getId() %>" value="<%=list.get(x).getO3() %>"/><%=list.get(x).getO3() %><br><br> 
  <input type="radio" name="option<%=list.get(x).getId() %>" value="<%=list.get(x).getO4() %>" /><%=list.get(x).getO4() %><br><br> 
  
  <% 
  } %>
  
   <%  if(pageStart == list.size()-1)
    {
    	%> 
    	<div class="btn-group btn-group-sm">
    	<input class="btn btn-primary" type=submit name="prev" value=Previous></div>
    	<div class="btn-group btn-group-sm">
    	<input class="btn btn-danger" type=submit  name="submit" value=Submit onclick="f3()"></div>
    	
    	<% }
   else if(pageStart==0){
	   %><div class="btn-group btn-group-sm">
	    <input class="btn btn-primary" type=submit name="exam" value=Next>
	   </div>
  <%  }
    else{
    	
    %>
    <div class="btn-group btn-group-sm">
    <input class="btn btn-primary" type=submit name="prev" value=Previous></div>
     <div class="btn-group btn-group-sm">
   <input class="btn btn-primary" type=submit name="exam" value=Next>
    </div>
    <% }
  %>
  
  </form>
  </div>
  </body>
  <div id="footer" class="copy" style="margin-top:100px">
			<div class="container text-center"  style="margin-top:10px">
				<p class="text-muted credit">© 2017 - A software by Wexos</p>
			</div>
		</div>
  
  </html>