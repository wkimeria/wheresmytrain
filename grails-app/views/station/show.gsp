
<%@ page import="com.trainschedule.Station"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-station" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>

	<div id="show-station" class="content scaffold-show" role="main">
		<h1>
			${stationInstance?.stopName}
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list station">
			<g:each var="station" in="${schedule}">				
				<g:each var="destination" in="${station.value}">
					<h3>Destination: ${destination.key}</h3>
					<p>Arriving</p>
					<g:each var="arrivals" in="${destination.value}">
					
						<p>${arrivals} Minutes</p>
					</g:each>
				</g:each>
			</g:each>




		</ol>
		
	</div>
</body>
</html>
