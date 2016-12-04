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
h1 { font-size: 48px; font-family: 'Signika', sans-serif; }


p { word-wrap: break-word; max-width: 700px; padding-left: 25; font-family: 'Inder', sans-serif; line-height: 28px; margin-bottom: 15px; color: #666; }


a { color: #5bc0de; transition: .5s; -moz-transition: .5s; -webkit-transition: .5s; -o-transition: .5s; }


a:hover { color: #5bc0de }


.delete { float: right; padding-right: 25px }


.author { float: left; padding-right: 25px}


.entry-content { border-bottom: 3px solid #666; padding: 0 0 15px 0; margin-bottom: 8px; }


.meta-info { padding: 5px; overflow: hidden; }


.meta-info p { font-family: 'Fenix', serif; font-style: italic; color: #666; font-size: 16px; }

tr.awesome{
	background-color: #333;
	color: #f2f2f2;
	text-align: left;
	font-size: 17px;
}
div {
	padding-top: 25px;
	padding-bottom: 25px;
}

div.thread {
	padding-top: 50px;
	padding-bottom: 50px;
	padding-right: 1000px;
}
div.answers {
	padding-top: 50px;
	padding-bottom: 50px;
	boarder-style: solid;
	boarder-right: thick double;
}
div.post
{
	max-width: 1000px;
	padding-left: 10px;
}
div.screen
{
	border: 2px solid ;
    border-radius: 5px;
}

div.response
{
    border: 1px solid ;
    border-radius: 5px;
    max-width: 1000px;
	padding-left: 25px;
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
DiscussionDAO key = new DiscussionDAO();


//controller{
String action = request.getParameter("action");
String author = session.getAttribute("name").toString();
String body = request.getParameter("body");
String id = request.getParameter("id");
String rid = request.getParameter("rid");
String name = request.getParameter("name");
Forum_post app = new Forum_post();
Forum_table app3 = new Forum_table();


app3 = key.selectOnename(Integer.parseInt(id));

if("create2".equals(action)){
	app = new Forum_post(author, body);
	key.create2(app, Integer.parseInt(id));
	
} else if ("remove".equals(action)){
	int idInt = Integer.parseInt(rid);
	key.removee(idInt);
} 

List<Forum_post> applications = key.selectAll2();

%>

<div class = "post">
	<h1><%= app3.getThread_name()%></h1>
	<hr>
	<p>
		<%=app3.getThread_description() %>
	</p>
	<a class = "author"> Author: <%=app3.getAuthor() %></a>
</div>
<form action="post.jsp">


<div class="answers">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#original">Reply</button>
			<div id="original" class="collapse">
		<input type="hidden" name="id" value="<%= id%>"/>
		<hr>
		<ul>
			<h5>Enter Comment Below</h5><input name= "body" class="form-control" style="width: 500px; height: 100px"/>
			
				<br>
				<button  class="btn btn-info" name="action" value="create2">
					Post
				</button>
		</ul>
			</div>
		</div>		
<table class = "table">

<% for(Forum_post ap:applications ){


	//System.out.println(app3.getId());
%>
	<% if( Integer.parseInt(id) == ap.getOp_id()) {%>
	<tr>
	<div class = "response">
	<%if(author.equals(ap.getPost_author())){ %>
			<a class = "delete"; href="post.jsp?action=remove&id=<%= id %>&rid=<%= ap.getPost_id() %>">
				Delete
			</a>
			<%} %>
		<p><%= ap.getPost_body() %></p>
		<a class = "author">Author: <%= ap.getPost_author() %></a>
		</div>
	</tr>

<%	
	}
}
%>

</table>
<div class="answers">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#original1">Reply</button>
			<div id="original1" class="collapse">
		<input type="hidden" name="id" value="<%= id%>"/>
		<hr>
		<ul>
			<h5>Enter Comment Below</h5><input name= "body" class="form-control" style="width: 500px; height: 100px""/>
			
				<br>
				<button  class="btn btn-info" name="action" value="create2">
					Post
				</button>
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
