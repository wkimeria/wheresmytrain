
<%@ page import="com.trainschedule.Station" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<gvisualization:apiImport />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'station.label', default: 'Station')}" />
	<title>Where's My Train?</title>
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
				var map = 
		new google.visualization.Map(document
							.getElementById('map'));
					map.draw(visualization_data, {
						showTip : true,
						mapType : "normal"

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

			$(function(){
			    $('li.inactive').click(function(){
			        $('li.inactive').removeClass('inactive');
			        $(this).addClass('active');
			    });
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
	
	<ul class="nav nav-pills">
  <li class="inactive"><g:link action="Red"><font color="red">Red Line</font></g:link>
  </li>
  <li class="inactive"><g:link action="Orange"><font color="orange">Orange Line</font></g:link></li>
  <li class="inactive"><g:link action="Blue"><font color="blue">Blue Line</font></g:link></li>
</ul>
	
<section id="list-station" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="line" title="${message(code: 'station.line.label', default: 'Line')}" />
			
				<g:sortableColumn property="stopName" title="${message(code: 'station.stopName.label', default: 'Stop Name')}" />
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${stationInstanceList}" status="i" var="stationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: stationInstance, field: "line")}</td>
				<td><g:link action="show" id="${stationInstance.id}">${fieldValue(bean: stationInstance, field: "stopName")}</g:link></td>		
				
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${stationInstanceTotal}" />
	</div>
</section>

</body>

</html>
