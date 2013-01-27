
<%@ page import="com.trainschedule.Station" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<gvisualization:apiImport/>
		<g:set var="entityName" value="${message(code: 'station.label', default: 'Station')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript">
			window.onload = setupRefresh;
			
			function setupRefresh() {
			  setTimeout("refreshPage();", 30000);
			}
			function refreshPage() {
			   window.location = location.href;
			}
		</script>
	</head>
	<body>
		<a href="#list-station" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<gvisualization:map elementId = "map" columns="${mapColumns}" data="${mapData}" showTip="${true}"/>
		<div id="map" style="width: 100%;"></div>
		<div id="list-station" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="line" title="${message(code: 'station.line.label', default: 'Line')}" />
					
						<g:sortableColumn property="platformKey" title="${message(code: 'station.platformKey.label', default: 'Platform Key')}" />
					
						<g:sortableColumn property="platformName" title="${message(code: 'station.platformName.label', default: 'Platform Name')}" />
					
						<g:sortableColumn property="stationName" title="${message(code: 'station.stationName.label', default: 'Station Name')}" />
					
						<g:sortableColumn property="platformOrder" title="${message(code: 'station.platformOrder.label', default: 'Platform Order')}" />
					
						<g:sortableColumn property="startOfLine" title="${message(code: 'station.startOfLine.label', default: 'Start Of Line')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stationInstanceList}" status="i" var="stationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stationInstance.id}">${fieldValue(bean: stationInstance, field: "line")}</g:link></td>
					
						<td>${fieldValue(bean: stationInstance, field: "platformKey")}</td>
					
						<td>${fieldValue(bean: stationInstance, field: "platformName")}</td>
					
						<td>${fieldValue(bean: stationInstance, field: "stationName")}</td>
					
						<td>${fieldValue(bean: stationInstance, field: "platformOrder")}</td>
					
						<td>${fieldValue(bean: stationInstance, field: "startOfLine")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>