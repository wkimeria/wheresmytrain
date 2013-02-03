package com.trainschedule

class Station {
	
	String line
	int platformOrder
	String stopName
	double latitude
	double longitude

    static constraints = {
		line blank:false, inList: ["Red", "Blue", "Orange"]
		platformOrder blank:false
		stopName blank:false, unique: ['line']
		latitude blank:false
		longitude blank:false
		latitude min:-90d, max:90d
		longitude()
    }
	
	String toString(){"${stopName}"}
}
