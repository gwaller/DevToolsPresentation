<!doctype html>
<html>
	<head>
	
		<title>PhotoView</title>
		
		
		<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
		
	</head>
	<body>
				
		<div class="container-fluid">
		
		<div class="row-fluid">
    		
    		<div class="span8 offset2">
      			<!--Body content-->
      			<h1>PhotoView</h1>
				<p>Welcome to PhotoView .....</p>
	
				<g:if test="${flash.message}">
					<div class="alert alert-error">${flash.message}</div>
				</g:if>
	
				<div>
				    <g:form url="[controller: 'search', action:'search']" class="form-search">
				    <legend>Search for photos</legend>
  					<input type="text" name="q" class="input-xlarge search-query" placeholder="Enter search term...">
  					<button type="submit" class="btn">Search</button>
				    </g:form>
	

				</div>
      		</div>
      	</div>
		
		
  		
				
		
	
		
	<g:javascript src="bootstrap.min.js" />
		
	</body>
</html>
