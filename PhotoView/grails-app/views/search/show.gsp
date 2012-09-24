
<%@ page import="photoview.Photo" %>
<!doctype html>
<html>
	<head>
		
		<title><g:fieldValue bean="${photoInstance}" field="title"/></title>
		<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
	</head>
	<body>
		
		<div class="container-fluid">
		
		<div class="span4 offset4">
			<h1>${fieldValue(bean: photoInstance, field: "title")}</h1>
			</div>
		
		<div class="row-fluid">
		
			
			
			<div class="span9"><img src="${createLink(controller: 'Photo', action: 'showPhoto', params:[id:photoInstance.id])}"/></div>
			
			<div class="span3">
				
				<dl class="dl-horizontal">
  				<dt>Title</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "title")}</dd>
  				<dt>Aperture</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "aperture")}</dd>
  				<dt>ISO</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "iso")}</dd>
  				
  				
  				<dt>Focal Length</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "focalLength")}</dd>
  				<dt>Exposure Time</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "exposureTime")}</dd>
  				
  				<dt>Camera Model</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "cameraModel")}</dd>
  				<dt>Lens</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "lens")}</dd>
  				
  				<dt>Licence</dt>
  				<dd>${fieldValue(bean: photoInstance, field: "licence")}</dd>
				</dl>
				
			</div>
			
			
		
		</div>
		
		
		</div>
		
	</body>
</html>
