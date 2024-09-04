<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="alljs_css.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>


		<h3 class="text-center">Please fill the form to add your note</h3>
		<br />


		<!-- this is add form -->
		<div class="col-md-6 offset-md-3">
			<form action="SaveNoteServlet" method="POST">
				<div class="mb-3">
					<label for="title" class="form-label">Note Title</label> <input
						type="text" class="form-control" name="title" id="title"
						placeholder="Enter your note title here" required />
					<div id="" class="form-text">Add your note to publish.</div>
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">Note Content</label>
					<textarea id="content" placeholder="Enter your content here"
						name="content" class="form-control" required
						style="height: 200px;"></textarea>
				</div>

				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>