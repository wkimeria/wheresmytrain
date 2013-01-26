<%@ page import="com.trainschedule.Station" %>



<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'line', 'error')} required">
	<label for="line">
		<g:message code="station.line.label" default="Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="line" required="" value="${stationInstance?.line}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'platformKey', 'error')} required">
	<label for="platformKey">
		<g:message code="station.platformKey.label" default="Platform Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="platformKey" required="" value="${stationInstance?.platformKey}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'platformName', 'error')} required">
	<label for="platformName">
		<g:message code="station.platformName.label" default="Platform Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="platformName" required="" value="${stationInstance?.platformName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stationName', 'error')} required">
	<label for="stationName">
		<g:message code="station.stationName.label" default="Station Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stationName" required="" value="${stationInstance?.stationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'platformOrder', 'error')} required">
	<label for="platformOrder">
		<g:message code="station.platformOrder.label" default="Platform Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="platformOrder" required="" value="${stationInstance?.platformOrder}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'startOfLine', 'error')} required">
	<label for="startOfLine">
		<g:message code="station.startOfLine.label" default="Start Of Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="startOfLine" required="" value="${stationInstance?.startOfLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'endOfLine', 'error')} required">
	<label for="endOfLine">
		<g:message code="station.endOfLine.label" default="End Of Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endOfLine" required="" value="${stationInstance?.endOfLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="station.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branch" required="" value="${stationInstance?.branch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'direction', 'error')} required">
	<label for="direction">
		<g:message code="station.direction.label" default="Direction" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direction" required="" value="${stationInstance?.direction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stopId', 'error')} required">
	<label for="stopId">
		<g:message code="station.stopId.label" default="Stop Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stopId" required="" value="${stationInstance?.stopId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stopName', 'error')} required">
	<label for="stopName">
		<g:message code="station.stopName.label" default="Stop Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stopName" required="" value="${stationInstance?.stopName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="station.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: stationInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="station.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: stationInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stopCode', 'error')} ">
	<label for="stopCode">
		<g:message code="station.stopCode.label" default="Stop Code" />
		
	</label>
	<g:textField name="stopCode" value="${stationInstance?.stopCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stopDescription', 'error')} ">
	<label for="stopDescription">
		<g:message code="station.stopDescription.label" default="Stop Description" />
		
	</label>
	<g:textField name="stopDescription" value="${stationInstance?.stopDescription}"/>
</div>

