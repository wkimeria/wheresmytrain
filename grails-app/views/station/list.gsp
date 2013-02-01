
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

</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			window.onload = setupRefresh;

			function setupRefresh() {
				setTimeout("refreshPage();", 30000);
			}
			function refreshPage() {
				window.location = location.href;
			}

			$(function() {
				$("#tabs").tabs();
			});
		});
	</script>
	<a href="#list-station" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
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

						<g:sortableColumn property="line"
							title="${message(code: 'station.line.label', default: 'Line')}" />

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
										${fieldValue(bean: stationInstance, field: "line")}
									</g:link></td>

								<td>
									${fieldValue(bean: stationInstance, field: "stopName")}
								</td>

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

						<g:sortableColumn property="line"
							title="${message(code: 'station.line.label', default: 'Line')}" />

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
										${fieldValue(bean: stationInstance, field: "line")}
									</g:link></td>

								<td>
									${fieldValue(bean: stationInstance, field: "stopName")}
								</td>

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

						<g:sortableColumn property="line"
							title="${message(code: 'station.line.label', default: 'Line')}" />

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
										${fieldValue(bean: stationInstance, field: "line")}
									</g:link></td>

								<td>
									${fieldValue(bean: stationInstance, field: "stopName")}
								</td>

							</tr>
						</g:if>

					</g:each>
				</tbody>
			</table>


		</div>
	</div>

</body>
</html>
