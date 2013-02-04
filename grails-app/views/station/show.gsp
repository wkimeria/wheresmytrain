
<%@ page import="com.trainschedule.Station"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title><g:message code="default.show.label" args="[entityName]" /></title>
<script type="text/javascript">	
	function updateEntry(data){		
		var html ="";
		$.each(data.schedule, function(key, value) {
			html += "<h3>" + key + "</h3><hr/>"; 
			$.each(value, function(k, v) {
				html += "<br/><strong>Destination: " + k + "</strong><br/>";				
				$.each(v, function(v1) {
					if(v1==0){
						html += "Arriving...<br/>";		
					}else{
						html += "Arriving in " + v1 + " minutes<br/>";		
					}
								
				});
			});
		});
		console.log(html);
		$("#show-station").html(html);		
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#show-station").click();		
	});

	setInterval(function(){$("#show-station").click();},10000);
	
	</script>
	<a href="#show-station" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>			
		<div id="show-station" class="content scaffold-show" role="main" onclick="${remoteFunction(
										                                    controller: 'station',
										                                    action: 'showAjax',
										                                    params: "\'id=${stationInstance?.id}\'",
										                                    onSuccess:'updateEntry(data)')}" >  											            
		test
	</div>
</body>
</html>
