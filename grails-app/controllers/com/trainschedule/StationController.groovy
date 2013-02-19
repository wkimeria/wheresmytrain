package com.trainschedule

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException

class StationController {
	def stationService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = 200
		def result
		preventCache(response)		
		if(params?.line){			
			[stationInstanceList: Station.findAllByLine(params.line.capitalize(),[max:max, sort: "platformOrder", order: "desc"]), stationInstanceTotal: Station.count(),
			mapColumns: stationService.headers(), mapData: stationService.data()]	
		}else{
			[stationInstanceList: Station.list(max:max, sort: "platformOrder", order: "desc"), stationInstanceTotal: Station.count(),
			mapColumns: stationService.headers(), mapData: stationService.data()]
		}		
			
	}
	
	def listAjax(Integer max) {
		params.max = 200
		def data = []
		def resp = new JSONObject([stationInstanceList: Station.list(max:max, sort: "platformOrder", order: "desc"), stationInstanceTotal: Station.count(),
			mapColumns: stationService.headers(), mapData: stationService.data()])
		preventCache(response)
		render resp as JSON
	}

	def show(Long id) {
		def stationInstance = Station.get(id)
		if (!stationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
			redirect(action: "list")
			return
		}
		def schedule = stationService.getRealTimeInfoForStation(stationInstance)
		[stationInstance: stationInstance, schedule:schedule]
	}
	
	def showAjax(Long id) {		
		log.debug("showAjax called with ${params}")
		def stationInstance = Station.get(id)
		if (!stationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
			redirect(action: "list")
			return
		}
		def schedule = stationService.getRealTimeInfoForStation(stationInstance)
		def resp = new JSONObject([stationInstance: stationInstance, schedule:schedule])
		preventCache(response)
		render resp as JSON
	}
	
	private static final String HEADER_PRAGMA = "Pragma";
	private static final String HEADER_EXPIRES = "Expires";
	private static final String HEADER_CACHE_CONTROL = "Cache-Control";
	
	protected preventCache (response) {
		response.setHeader(HEADER_PRAGMA, "no-cache");
		response.setDateHeader(HEADER_EXPIRES, 1L);
		response.setHeader(HEADER_CACHE_CONTROL, "no-cache");
		response.addHeader(HEADER_CACHE_CONTROL, "no-store");
	}
}
