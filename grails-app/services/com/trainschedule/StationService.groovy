package com.trainschedule

import org.codehaus.groovy.grails.web.json.JSONObject

class StationService {
	
	def scheduleInformationService

	def headers(){
		[['number','Lat'],['number','Lng'],['string','Name']]
	}
	
    def data(){
		Station.list().collect { s ->			
			[s.latitude, s.longitude, getRealTimeInfoForStation(s)]			
		}
	}
	
	def getRealTimeInfoForStation(Station s){
		return getTimesForStation(s)		
	}
	
	def getTimesForStation(Station s){
		def stationSchedule =[:]		
		def lineData = scheduleInformationService.getScheduleForLine(s.line)
		
		if(lineData){
			lineData.TripList.Trips.each{ direction ->
				def destination = direction.Destination
				
				direction.Predictions.each{ prediction ->
					if(prediction?.Stop ==  s.stopName?.replace("Station","").trim()){
						if(stationSchedule.containsKey(destination)){
							def info =  stationSchedule.get(destination)
							info.add(new BigDecimal(prediction.Seconds/60).intValue())
							stationSchedule.put(destination,info)
						}else{
						   stationSchedule.put(destination,[new BigDecimal(prediction.Seconds/60).intValue()])
						}
					}
				}
			}
			def result =s.toString()
			stationSchedule.each{
				result+="\\n" + it
			}			
			return result
		}else{		
			return s.toString()
		}		
	}	
}
