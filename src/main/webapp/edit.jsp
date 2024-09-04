<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="alljs_css.jsp"%>
</head>
<body>


	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>

		<h1 class="text-center mt-2">This is Edit note page</h1>
		
		<br/>

		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<div class="col-md-6 offset-md-3">
			<form action="UpdateServlet" method="POST">
				<input value="<%=note.getId()%>" name="noteId" type="hidden" />
				<div class="mb-3">
					<label for="title" class="form-label">Note Title</label> <input
						type="text" class="form-control" name="title" id="title"
						value="<%=note.getTitle()%>"
						placeholder="Enter your note title here" required />
					<div id="" class="form-text">Add your note to publish.</div>
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">Note Content</label>
					<textarea id="content" placeholder="Enter your content here"
						name="content" class="form-control" required
						style="height: 200px;"><%=note.getContent()%></textarea>
				</div>

				<div class="container text-center">
					<button type="submit" class="btn btn-success">Save Your
						Note</button>
				</div>
			</form>
		</div>
	</div>




</body>
</html>