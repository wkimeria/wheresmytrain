package com.trainschedule

import org.codehaus.groovy.grails.web.json.JSONObject

class StationService {
	
	def scheduleInformationService

	def headers(){
		[['number','Lat'],['number','Lng'],['string','Name']]
	}
	
    def data(){
		Station.list().collect { s ->			
			[s.latitude, s.longitude, getRealTimeInfoForStation(s, "html")]			
		}
	}
	
	def getRealTimeInfoForStation(Station s, format="map"){		
		def lineData = scheduleInformationService.getScheduleForLine(s.line)
		return getTimesForStation(s, lineData, format)				
	}
	
	def getTimesForStation(Station s, JSONObject lineData, format="map"){
		def stationSchedule =[:]		
		if(lineData){
			lineData.TripList.Trips.each{ direction ->
				def destination = direction.Destination
				
				direction.Predictions.each{ prediction ->
					String formattedName
					//TODO:This should be fixed by mapping name in file to name in data returned
					if(s.stopName!='South Station'){
						formattedName = s.stopName?.replace("Station","").trim()
					}else{
						formattedName = s.stopName?.trim()
					}
					if(prediction?.Stop ==  formattedName){
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
			
			def result
			stationSchedule.each{
				it = it.value?.sort()
				
			}
			
			if(format=="map"){
				result = [:]
				result.put(s.toString(),stationSchedule)
			}else{
				result = "<h3>${s.toString()}</h3><br/>"				
				stationSchedule.each{ dest->
					result += "Destination:${dest.key}<br/><hr/>"
					dest.value.each{ arrival ->
						if(arrival == 0){
							result += "Arriving...<br/>"
						}else{
							result += "Arriving in ${arrival} minutes<br/>"
						}
						
					}
					result += "<br/>"
				}
			}			 
			return result
		}else{		
			return s.toString()
		}		
	}	
}
