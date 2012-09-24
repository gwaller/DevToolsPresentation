<%@ page import="photoview.Photo" %>
<!doctype html>
<html>
	<head>
	
		<title>PhotoView</title>
		
		
		<link href="${resource(dir:'css',file:'bootstrap.css')}" rel="stylesheet">
		
	</head>
	<body>
				
		<div class="container-fluid">
		
		<div class="row-fluid">
    		
    		<div class="span3">
    			<h3>Filter Results</h3>
    			
    			<!-- Facets -->
    			<g:each in="${solrQueryResp.facetFields}" status="i" var="facetField">
    				
    				<h5 class="text-info">${facetField.name}</h5>
    				<ul>
    					<g:each in="${facetField.values}" status="z" var="facetValue">
    						<li>${facetValue.name} <span class="badge badge-info">${facetValue.count}</span></li>
    					</g:each>
    				</ul>
    				
    				
    			</g:each>
    			
    		</div>
    		
    		<div class="span9">
      			<!--Body content-->
      			<h1>Search Results</h1>
				
	
				<g:if test="${flash.message}">
					<div class="alert alert-error">${flash.message}</div>
				</g:if>
				
				<div class="alert alert-success">Your search for '${q}' returned ${photoInstanceTotal} results</div>
	
				<table class="table table-striped">
				<thead>
					<tr>
					
						<th>Title</th>
					
						<th>Aperture</th>
					
						<th>Exposure Time</th>
					
						<th>File Name</th>
					
						<th>Focal Length</th>
					
						<th>ISO</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${photoInstanceList}" status="i" var="photoInstance">
					<tr>
					
						<td><g:link action="show" id="${photoInstance.id}">${fieldValue(bean: photoInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: photoInstance, field: "aperture")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "exposureTime")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "fileName")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "focalLength")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "iso")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${photoInstanceTotal}" />
			</div>
      		</div>
      	</div>
		
		
  		
				
		
	
		
	<g:javascript src="bootstrap.min.js" />
		
	</body>
</html>
