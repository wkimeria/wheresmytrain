<%@ page import="com.trainschedule.Station" %>



			<div class="control-group fieldcontain ${hasErrors(bean: stationInstance, field: 'line', 'error')} required">
				<label for="line" class="control-label"><g:message code="station.line.label" default="Line" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="line" from="${stationInstance.constraints.line.inList}" required="" value="${stationInstance?.line}" valueMessagePrefix="station.line"/>
					<span class="help-inline">${hasErrors(bean: stationInstance, field: 'line', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: stationInstance, field: 'platformOrder', 'error')} required">
				<label for="platformOrder" class="control-label"><g:message code="station.platformOrder.label" default="Platform Order" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="platformOrder" required="" value="${stationInstance.platformOrder}"/>
					<span class="help-inline">${hasErrors(bean: stationInstance, field: 'platformOrder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: stationInstance, field: 'stopName', 'error')} required">
				<label for="stopName" class="control-label"><g:message code="station.stopName.label" default="Stop Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="stopName" required="" value="${stationInstance?.stopName}"/>
					<span class="help-inline">${hasErrors(bean: stationInstance, field: 'stopName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: stationInstance, field: 'latitude', 'error')} required">
				<label for="latitude" class="control-label"><g:message code="station.latitude.label" default="Latitude" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="latitude" step="any" min="-90.0" max="90.0" required="" value="${stationInstance.latitude}"/>
					<span class="help-inline">${hasErrors(bean: stationInstance, field: 'latitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: stationInstance, field: 'longitude', 'error')} required">
				<label for="longitude" class="control-label"><g:message code="station.longitude.label" default="Longitude" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="longitude" step="any" required="" value="${stationInstance.longitude}"/>
					<span class="help-inline">${hasErrors(bean: stationInstance, field: 'longitude', 'error')}</span>
				</div>
			</div>

