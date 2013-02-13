
<%@ page import="com.trainschedule.Station"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<gvisualization:apiImport />
<g:javascript library="jquery" />
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'station.label', default: 'Station')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<script type="text/javascript">
	window.onload = setupRefresh;

	function setupRefresh() {
		setInterval(function() {
			refreshPage();
		}, 30000);		
	}
	function refreshPage() {
		console.log("refreshing map...");
		//window.location = location.href;
		$.ajax({
		url:"${request.contextPath}/station/listAjax",
			dataType : 'json',
			data : {
				topicId : $('#topic').val(),
			},
			success : function(resp) {
				visualization_data = new google.visualization.DataTable();
				$.each(resp.mapColumns, function(index, value) {
					visualization_data.addColumn(value[0], value[1]);
				});
				$.each(resp.mapData, function(index, value) {
					visualization_data.addRow(value);
				});
				var map = new google.visualization.Map(document
						.getElementById('map'));
				map.draw(visualization_data, {
					showTip : true,
					mapType: "normal"
					
				});
			},
			error : function(request, status, error) {

			},
			complete : function() {
			}
		});
	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("#tabs").tabs();
			});

			if (screen.width < 700) {
				$("#map").hide();
			} else {

				$("#map").show();
			}
		});
	</script>

	<gvisualization:map mapType="normal" elementId="map"
		columns="${mapColumns}" data="${mapData}" showTip="${true}" />
	<div id="map" style="width: 100%;"></div>
	<div id="tabs">
		<ul>
			<li><a href="#red-line"><font color="red">Red Line</font></a></li>
			<li><a href="#orange-line"><font color="orange">Orange
						Line</font></a></li>
			<li><a href="#blue-line"><font color="blue">Blue Line</font></a></li>
		</ul>
		<div id="red-line">
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
