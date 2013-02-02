
<%@ page import="com.trainschedule.Station"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<gvisualization:apiImport />
<g:javascript library="jquery" />
<g:set var="entityName"
	value="${message(code: 'station.label', default: 'Station')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<script type="text/javascript">
	window.onload = setupRefresh;

	function setupRefresh() {
		setTimeout("refreshPage();", 10000);
	}
	function refreshPage() {
		window.location = location.href;
	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("#tabs").tabs();
			});
		});
	</script>
	
	<gvisualization:map elementId="map" columns="${mapColumns}"
		data="${mapData}" showTip="${true}" />
	<div id="map" style="width: 100%;"></div>
	<div id="tabs">
		<ul>
			<li><a href="#red-line">Red Line</a></li>
			<li><a href="#orange-line">Orange Line</a></li>
			<li><a href="#blue-line">Blue Line</a></li>
		</ul>
		<div id="red-line">

			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="stopName"
							title="${message(code: 'station.stopName.label', default: 'Station Name')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${stationInstanceList}" status="i"
						var="stationInstance">
						<g:if test="${stationInstance.line == 'Red'}">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${stationInstance.id}">
										${fieldValue(bean: stationInstance, field: "stopName")}
								</g:link></td>
							</tr>
						</g:if>

					</g:each>
				</tbody>
			</table>


		</div>
		<div id="orange-line">

			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="stopName"
							title="${message(code: 'station.stopName.label', default: 'Station Name')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${stationInstanceList}" status="i"
						var="stationInstance">
						<g:if test="${stationInstance.line == 'Orange'}">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${stationInstance.id}">
										${fieldValue(bean: stationInstance, field: "stopName")}
								</g:link></td>
							</tr>
						</g:if>

					</g:each>
				</tbody>
			</table>

		</div>

		<div id="blue-line">
			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="stopName"
							title="${message(code: 'station.stopName.label', default: 'Station Name')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${stationInstanceList}" status="i"
						var="stationInstance">
						<g:if test="${stationInstance.line == 'Blue'}">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${stationInstance.id}">
										${fieldValue(bean: stationInstance, field: "stopName")}
								</g:link></td>
							</tr>
						</g:if>

					</g:each>
				</tbody>
			</table>


		</div>
	</div>

</body>
</html>
