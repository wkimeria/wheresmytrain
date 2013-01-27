package com.trainschedule

class Station {
	
	String line
	String platformKey
	String platformName
	String stationName
	String platformOrder
	String startOfLine
	String endOfLine
	String branch
	String direction
	String stopId
	String stopCode
	String stopName
	String stopDescription
	double latitude
	double longitude

    static constraints = {
		line blank:false, inList: ["Red", "Blue", "Orange"]
		platformKey blank:false
		platformName blank:false
		stationName blank:false
		platformOrder blank:false
		startOfLine blank:false
		endOfLine blank:false
		branch blank:false
		direction blank:false
		stopId blank:false		
		stopName blank:false, unique: ['line']
		latitude blank:false
		longitude blank:false
		latitude min:-90d, max:90d
		longitude()
    }
	
	String toString(){"${stopName}"}
}
