
<%@ page import="com.trainschedule.Station" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'station.label', default: 'Station')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-station" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-station" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list station">
			
				<g:if test="${stationInstance?.line}">
				<li class="fieldcontain">
					<span id="line-label" class="property-label"><g:message code="station.line.label" default="Line" /></span>
					
						<span class="property-value" aria-labelledby="line-label"><g:fieldValue bean="${stationInstance}" field="line"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.platformKey}">
				<li class="fieldcontain">
					<span id="platformKey-label" class="property-label"><g:message code="station.platformKey.label" default="Platform Key" /></span>
					
						<span class="property-value" aria-labelledby="platformKey-label"><g:fieldValue bean="${stationInstance}" field="platformKey"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.platformName}">
				<li class="fieldcontain">
					<span id="platformName-label" class="property-label"><g:message code="station.platformName.label" default="Platform Name" /></span>
					
						<span class="property-value" aria-labelledby="platformName-label"><g:fieldValue bean="${stationInstance}" field="platformName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.stationName}">
				<li class="fieldcontain">
					<span id="stationName-label" class="property-label"><g:message code="station.stationName.label" default="Station Name" /></span>
					
						<span class="property-value" aria-labelledby="stationName-label"><g:fieldValue bean="${stationInstance}" field="stationName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.platformOrder}">
				<li class="fieldcontain">
					<span id="platformOrder-label" class="property-label"><g:message code="station.platformOrder.label" default="Platform Order" /></span>
					
						<span class="property-value" aria-labelledby="platformOrder-label"><g:fieldValue bean="${stationInstance}" field="platformOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.startOfLine}">
				<li class="fieldcontain">
					<span id="startOfLine-label" class="property-label"><g:message code="station.startOfLine.label" default="Start Of Line" /></span>
					
						<span class="property-value" aria-labelledby="startOfLine-label"><g:fieldValue bean="${stationInstance}" field="startOfLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.endOfLine}">
				<li class="fieldcontain">
					<span id="endOfLine-label" class="property-label"><g:message code="station.endOfLine.label" default="End Of Line" /></span>
					
						<span class="property-value" aria-labelledby="endOfLine-label"><g:fieldValue bean="${stationInstance}" field="endOfLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="station.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:fieldValue bean="${stationInstance}" field="branch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.direction}">
				<li class="fieldcontain">
					<span id="direction-label" class="property-label"><g:message code="station.direction.label" default="Direction" /></span>
					
						<span class="property-value" aria-labelledby="direction-label"><g:fieldValue bean="${stationInstance}" field="direction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.stopId}">
				<li class="fieldcontain">
					<span id="stopId-label" class="property-label"><g:message code="station.stopId.label" default="Stop Id" /></span>
					
						<span class="property-value" aria-labelledby="stopId-label"><g:fieldValue bean="${stationInstance}" field="stopId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.stopName}">
				<li class="fieldcontain">
					<span id="stopName-label" class="property-label"><g:message code="station.stopName.label" default="Stop Name" /></span>
					
						<span class="property-value" aria-labelledby="stopName-label"><g:fieldValue bean="${stationInstance}" field="stopName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="station.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${stationInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="station.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${stationInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.stopCode}">
				<li class="fieldcontain">
					<span id="stopCode-label" class="property-label"><g:message code="station.stopCode.label" default="Stop Code" /></span>
					
						<span class="property-value" aria-labelledby="stopCode-label"><g:fieldValue bean="${stationInstance}" field="stopCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stationInstance?.stopDescription}">
				<li class="fieldcontain">
					<span id="stopDescription-label" class="property-label"><g:message code="station.stopDescription.label" default="Stop Description" /></span>
					
						<span class="property-value" aria-labelledby="stopDescription-label"><g:fieldValue bean="${stationInstance}" field="stopDescription"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stationInstance?.id}" />
					<g:link class="edit" action="edit" id="${stationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
