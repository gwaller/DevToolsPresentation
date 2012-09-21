
<%@ page import="photoview.Photo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-photo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'photo.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="aperture" title="${message(code: 'photo.aperture.label', default: 'Aperture')}" />
					
						<g:sortableColumn property="exposureTime" title="${message(code: 'photo.exposureTime.label', default: 'Exposure Time')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'photo.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="focalLength" title="${message(code: 'photo.focalLength.label', default: 'Focal Length')}" />
					
						<g:sortableColumn property="iso" title="${message(code: 'photo.iso.label', default: 'Iso')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${photoInstanceList}" status="i" var="photoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
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
	</body>
</html>
