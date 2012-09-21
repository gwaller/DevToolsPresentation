<%@ page import="photoview.Photo" %>



<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'aperture', 'error')} ">
	<label for="aperture">
		<g:message code="photo.aperture.label" default="Aperture" />
		
	</label>
	<g:textField name="aperture" value="${photoInstance?.aperture}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'cameraModel', 'error')} ">
	<label for="cameraModel">
		<g:message code="photo.cameraModel.label" default="Camera Model" />
		
	</label>
	<g:textField name="cameraModel" value="${photoInstance?.cameraModel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'exposureTime', 'error')} ">
	<label for="exposureTime">
		<g:message code="photo.exposureTime.label" default="Exposure Time" />
		
	</label>
	<g:textField name="exposureTime" value="${photoInstance?.exposureTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="photo.fileName.label" default="File Name" />
		
	</label>
	<g:textField name="fileName" value="${photoInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'focalLength', 'error')} ">
	<label for="focalLength">
		<g:message code="photo.focalLength.label" default="Focal Length" />
		
	</label>
	<g:textField name="focalLength" value="${photoInstance?.focalLength}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'iso', 'error')} ">
	<label for="iso">
		<g:message code="photo.iso.label" default="Iso" />
		
	</label>
	<g:textField name="iso" value="${photoInstance?.iso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'lens', 'error')} ">
	<label for="lens">
		<g:message code="photo.lens.label" default="Lens" />
		
	</label>
	<g:textField name="lens" value="${photoInstance?.lens}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'licence', 'error')} ">
	<label for="licence">
		<g:message code="photo.licence.label" default="Licence" />
		
	</label>
	<g:textField name="licence" value="${photoInstance?.licence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="photo.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${photoInstance?.title}"/>
</div>

