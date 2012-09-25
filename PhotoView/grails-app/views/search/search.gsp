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
    			<%
    				/*
					fqList contains a list of the fq params e.g. [iso_facet:200,aperture_facet:5.6]
					
					facetQueryMap is a map containg the facet queries - key is facet field name and value is the string searched for
					If facet field name in facetQueryMap, user is filtering on that facet so need to display remove button and the link has the facet query removed from fqList
					
					If not in fqList then iterate over the values of the facet fields returned, show them with a link (fqList now has that query added)
					*/
    			%>  
    				
    			
    			<g:each in="${allFacets}" var="facetName">
    				<h5 class="text-info"><g:message code="${facetName}" /></h5>
	   				<ul>
	   					<g:if test="${facetQueryMap.containsKey(facetName)}">
	   						<g:set var="v" value="${facetQueryMap[facetName]}"/>
	   						<g:set var="fqList" value='${fqList - ["$facetName:$v"]}' />
	   						<li>${v} &nbsp; <g:link action="search" params="[q:q,fq:fqList]"><i class="icon-remove"></i></g:link></li>
	   					</g:if>
	   					<g:else>
	   						<g:each in='${solrQueryResp.getFacetField(facetName).values}' var="facetValue">
	     						<li><g:link action="search" params="[q:q,fq:fqList + [facetValue.asFilterQuery]]">${facetValue.name}</g:link> <span class="badge">${facetValue.count}</span></li>
	   						</g:each>
	   					</g:else>
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
					
						<td><g:link action="show" params="[id:photoInstance.id]">${fieldValue(bean: photoInstance, field: "title")}</g:link></td>
					
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
