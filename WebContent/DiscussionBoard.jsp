<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="InteractiveCalculus.Main.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Interactive Calculus Aid</title>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://wzrd.in/standalone/function-plot@1.17.3"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script
	src="http://maurizzzio.github.io/function-plot/js/function-plot.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" />
<style>
body {
	margin: 0;
}

tr.awesome{
	background-color: #333;
	color: #f2f2f2;
	text-align: left;
	font-size: 17px;
}
div {
	padding-top: 50px;
	padding-bottom: 50px;
}

div.answers {
	padding-top: 50px;
	padding-bottom: 50px;
	boarder-style: solid;
	boarder-right: thick double;
}

ul.topnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

ul.topnav li {
	float: left;
}

ul.topnav li a {
	display: inline-block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 17px;
}

ul.topnav li a:hover {
	background-color: #555;
}

ul.topnav li.icon {
	display: none;
}

@media screen and (max-width:680px) {
	ul.topnav li:not (:first-child ) {
		display: none;
	}
	ul.topnav li.icon {
		float: right;
		display: inline-block;
	}
}

@media screen and (max-width:680px) {
	ul.topnav.responsive {
		position: relative;
	}
	ul.topnav.responsive li.icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	ul.topnav.responsive li {
		float: none;
		display: inline;
	}
	ul.topnav.responsive li a {
		display: block;
		text-align: left;
	}
}
</style>
</head>
<%if(session.getAttribute("name") != null) 
{%>
<body>
	<ul class="topnav" id="myTopnav">
		<li><a class="active" href="/InteractiveCalculus/Main.jsp">Home</a></li>
		<li><a href="/InteractiveCalculus/Quiz.jsp">Quiz</a></li>
		<li><a href="/InteractiveCalculus/DiscussionBoard.jsp">Discussion Board</a></li>
		<%if(session.getAttribute("name") == null)
    	  {%>
		<li><a href="/InteractiveCalculus/CreateAccount.jsp">Create Account</a></li>
		<li><a href="/InteractiveCalculus/LogIn.jsp">Log In</a></li>
		<%} %>
		<%if(session.getAttribute("name") != null)
    	  {%>	
		<li><a href="/InteractiveCalculus/LogOut.jsp">Log Out</a></li>
		<%} %>
		<li class="icon"><a href="javascript:void(0);"
			style="font-size: 15px;" onclick="myFunction()">☰</a></li>
	</ul>
	
	<%
DiscussionDAO dao = new DiscussionDAO();


//controller{
String action = request.getParameter("action");
String name = request.getParameter("name");
String description = request.getParameter("description");
String id = request.getParameter("id");
String author = session.getAttribute("name").toString();
Forum_table app = new Forum_table();


if("create".equals(action)){
	app = new Forum_table(name, description, author);
	dao.create(app);
	
} else if ("remove".equals(action)){
	int idInt = Integer.parseInt(id);
	dao.remove(idInt);
}

List<Forum_table> applications = dao.selectAll();



//}
%>


<form action="DiscussionBoard.jsp">


<div class="answers">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#original">Add Discussion</button>
			<div id="original" class="collapse">
					<input type="hidden" name="id" value="<%= app.getThread_id() %>"/>
		<ul>
			<span><h5>Subject Title</h5><input name= "name" class="form-control" style="width: 400px;" value="<%= app.getThread_name()%>"/></span>
			<br>
			<span><h5>Description</h5><input name= "description" class="form-control" style="width: 500px; height: 100px" value="<%= app.getThread_description() %>"/></span>
			<span>
				<br>
				<button class="btn btn-info" name="action" value="create">
					Post
				</button>
			</span>
		</ul>
			</div>
		</div>
	<table class = "table">
	<tr class = "awesome">
	<td>Title: </td>
	<td>Author: </td>
	<td>
	<td>
	</tr>
<% for(Forum_table ap:applications){
%>
	<tr>
		<td><a href="post.jsp?action=select&id=<%= ap.getThread_id() %>"><%= ap.getThread_name()%></td>
		<td><%= ap.getAuthor() %></td>
		<td></td>
		<td>
			<%if(author.equals(ap.getAuthor())){ %>
			<a href="DiscussionBoard.jsp?action=remove&id=<%= ap.getThread_id() %>">
				Delete
			</a>
			<%} %>
		</td>
	</tr>

<%	
}
%>

</table>
<div class="answers">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#original1">Add Discussion</button>
			<div id="original1" class="collapse">
					<input type="hidden" name="id" value="<%= app.getThread_id() %>"/>
		<ul>
			<span><h5>Subject Title</h5><input name= "name" class="form-control" style="width: 400px;" value="<%= app.getThread_name()%>"/></span>
			<br>
			<span><h5>Description</h5><input name= "description" class="form-control" style="width: 500px; height: 100px" value="<%= app.getThread_description() %>"/></span>
			<span>
				<br>
				<button class="btn btn-info" name="action" value="create">
					Post
				</button>
			</span>
		</ul>
			</div>
		</div>

</form>



	<script>
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

</script>
</body>
<%} else
	{%>
<body>
	<ul class="topnav" id="myTopnav">
		<li><a class="active" href="/InteractiveCalculus/Main.jsp">Home</a></li>
		<li><a href="/InteractiveCalculus/Quiz.jsp">Quiz</a></li>
		<li><a href="/InteractiveCalculus/DiscussionBoard.jsp">Discussion Board</a></li>
		<%if(session.getAttribute("name") == null)
    	  {%>
		<li><a href="/InteractiveCalculus/CreateAccount.jsp">Create Account</a></li>
		<li><a href="/InteractiveCalculus/LogIn.jsp">Log In</a></li>
		<%} %>
		<%if(session.getAttribute("name") != null)
    	  {%>	
		<li><a href="/InteractiveCalculus/LogOut.jsp">Log Out</a></li>
		<%} %>
		<li class="icon"><a href="javascript:void(0);"
			style="font-size: 15px;" onclick="myFunction()">☰</a></li>
	</ul>
	<div>
		<center>
			<h1 class="">Discussion Board</h1>
		</center>
	</div>
	<div>
		<center>
			<h1>YOU MUST LOG IN FOR THIS FUNCTIONALITY</h1>
		</center>
	</div>
</body>
<%} %>
</html>