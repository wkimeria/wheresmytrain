
<%@ page import="com.trainschedule.Station" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'station.label', default: 'Station')}" />
	<title>${stationInstance?.stopName}</title>
	<script type="text/javascript">	
	function updateEntry(data){	
		console.log(data);	
		var html ="";
		$.each(data.schedule, function(key, value) {
			//html += "<h3>" + key + "</h3><hr/>"; 
			html += "<div align='center'>"; 
			$.each(value, function(k, v) {
				html += "<br/><strong>Destination: " + k + "</strong><br/>";				
				$.each(v, function(k1, v1) {
					if(v1==0){
						html += "Arriving...<br/>";		
					}else{
						html += "Arriving in " + v1 + " minutes<br/>";		
					}
								
				});
			});
			html += "</div>"; 
		});
		console.log(html);
		$("#show-station").html(html);		
	}
</script>
</head>
<body>
<script src="${resource(dir:'js', file:'jquery.ba-dotimeout.js')}" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#show-station").click();		

		$.doTimeout( 10000, function(){
			$("#show-station").click();
			return true;
		});
	});

	/*
	var delay = 10000;
	(function callee() {
		$("#show-station").click();
	    setTimeout(callee, delay);
	})();
	*/

	

	//setTimeout(function(){$("#show-station").click();},10000);
	
	</script>
		
		<div id="show-station" class="content scaffold-show" role="main" onclick="${remoteFunction(
										                                    controller: 'station',
										                                    action: 'showAjax',
										                                    params: "\'id=${stationInstance?.id}&time=${new Date()}\'",
										                                    onSuccess:'updateEntry(data)')}" >  											            
		test
	</div>
</body>
</html>
	