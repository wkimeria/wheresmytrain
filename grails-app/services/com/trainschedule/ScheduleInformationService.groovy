package com.trainschedule

import org.codehaus.groovy.grails.web.json.JSONObject

class ScheduleInformationService {
	
	def redisCachingService
	
	private final static BASE_URL ="http://Developer.mbta.com/lib/rthr/"

	def getScheduleForLine(String line){		
		def result = redisCachingService.get("schedule:${line.toLowerCase()}")
		if(result){
			return new JSONObject(result)
		}	
	}
	
	def cacheNewDataForLineFromMBTA(String line){
		def result = getScheduleForLineFromMBTA(line)
		redisCachingService.save("schedule:${line}", result, 60) //Expire after 30 seconds
	}
	
	def getScheduleForLineFromMBTA(String line){
		println "Calling MBTA For ${line} Line Schedule information..." 
		log.debug("Calling MBTA For ${line} Line Schedule information...")
		def result
		def url = "${BASE_URL}${line.toLowerCase()}.json"		
		result = url.toURL().text
		return result
	}
}
