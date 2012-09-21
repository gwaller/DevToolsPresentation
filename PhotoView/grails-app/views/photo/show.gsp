
<%@ page import="photoview.Photo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-photo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list photo">
			
				<g:if test="${photoInstance?.aperture}">
				<li class="fieldcontain">
					<span id="aperture-label" class="property-label"><g:message code="photo.aperture.label" default="Aperture" /></span>
					
						<span class="property-value" aria-labelledby="aperture-label"><g:fieldValue bean="${photoInstance}" field="aperture"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.cameraModel}">
				<li class="fieldcontain">
					<span id="cameraModel-label" class="property-label"><g:message code="photo.cameraModel.label" default="Camera Model" /></span>
					
						<span class="property-value" aria-labelledby="cameraModel-label"><g:fieldValue bean="${photoInstance}" field="cameraModel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.exposureTime}">
				<li class="fieldcontain">
					<span id="exposureTime-label" class="property-label"><g:message code="photo.exposureTime.label" default="Exposure Time" /></span>
					
						<span class="property-value" aria-labelledby="exposureTime-label"><g:fieldValue bean="${photoInstance}" field="exposureTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="photo.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${photoInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.focalLength}">
				<li class="fieldcontain">
					<span id="focalLength-label" class="property-label"><g:message code="photo.focalLength.label" default="Focal Length" /></span>
					
						<span class="property-value" aria-labelledby="focalLength-label"><g:fieldValue bean="${photoInstance}" field="focalLength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.iso}">
				<li class="fieldcontain">
					<span id="iso-label" class="property-label"><g:message code="photo.iso.label" default="Iso" /></span>
					
						<span class="property-value" aria-labelledby="iso-label"><g:fieldValue bean="${photoInstance}" field="iso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.lens}">
				<li class="fieldcontain">
					<span id="lens-label" class="property-label"><g:message code="photo.lens.label" default="Lens" /></span>
					
						<span class="property-value" aria-labelledby="lens-label"><g:fieldValue bean="${photoInstance}" field="lens"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.licence}">
				<li class="fieldcontain">
					<span id="licence-label" class="property-label"><g:message code="photo.licence.label" default="Licence" /></span>
					
						<span class="property-value" aria-labelledby="licence-label"><g:fieldValue bean="${photoInstance}" field="licence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="photo.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${photoInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${photoInstance?.id}" />
					<g:link class="edit" action="edit" id="${photoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
