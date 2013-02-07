package com.trainschedule

import grails.test.mixin.*
import org.junit.*
import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(StationService)
class StationServiceTests {

    void testHeaders() {		
        def result = service.headers()
		assert result == [['number','Lat'],['number','Lng'],['string','Name']]
    }
	
	void testTimesForStation(){
		
		Station station = new Station(
			line: "red",
			platformKey:"a",
			platformName:"a",
			stationName:"a",
			platformOrder:"a",
			startOfLine:"a",
			endOfLine:"true",
			branch:"a",
			direction:"a",
			stopId:"a",
			stopCode:"a",
			stopName:"Ruggles Station",
			stopDescription:"a",
			latitude:1.0,
			longitude:2.0)
		
		def lineData = '''
			               {
			    "TripList": {
			        "CurrentTime": 1359211510,
			        "Line": "Orange",
			        "Trips": [
			            {
			                "TripID": "O985F623F",
			                "Destination": "Oak Grove",
			                "Position": {
			                    "Timestamp": 1359211493,
			                    "Train": "1207",
			                    "Lat": 42.32318,
			                    "Long": -71.09982,
			                    "Heading": 15
			                },
			                "Predictions": [
			                    {
			                        "StopID": "70009",
			                        "Stop": "Roxbury Crossing",
			                        "Seconds": 84
			                    },
			                    {
			                        "StopID": "70011",
			                        "Stop": "Ruggles",
			                        "Seconds": 177
			                    },
			                    {
			                        "StopID": "70013",
			                        "Stop": "Mass Ave",
			                        "Seconds": 274
			                    },
			                    {
			                        "StopID": "70015",
			                        "Stop": "Back Bay",
			                        "Seconds": 410
			                    },
			                    {
			                        "StopID": "70017",
			                        "Stop": "Tufts Medical",
			                        "Seconds": 540
			                    },
			                    {
			                        "StopID": "70019",
			                        "Stop": "Chinatown",
			                        "Seconds": 626
			                    },
			                    {
			                        "StopID": "70021",
			                        "Stop": "Downtown Crossing",
			                        "Seconds": 708
			                    },
			                    {
			                        "StopID": "70023",
			                        "Stop": "State Street",
			                        "Seconds": 823
			                    },
			                    {
			                        "StopID": "70025",
			                        "Stop": "Haymarket",
			                        "Seconds": 930
			                    },
			                    {
			                        "StopID": "70027",
			                        "Stop": "North Station",
			                        "Seconds": 1137
			                    }
			                ]
			            },
			            {
			                "TripID": "O985F631A",
			                "Destination": "Forest Hills",
			                "Position": {
			                    "Timestamp": 1359211428,
			                    "Train": "1254",
			                    "Lat": 42.38425,
			                    "Long": -71.07695,
			                    "Heading": 355
			                },
			                "Predictions": [
			                    {
			                        "StopID": "70033",
			                        "Stop": "Wellington",
			                        "Seconds": 86
			                    },
			                    {
			                        "StopID": "70035",
			                        "Stop": "Malden Center",
			                        "Seconds": 305
			                    },
			                    {
			                        "StopID": "70036",
			                        "Stop": "Oak Grove",
			                        "Seconds": 450
			                    }
			                ]
			            },
			            {
			                "TripID": "O985F61F8",
			                "Destination": "Oak Grove",
			                "Position": {
			                    "Timestamp": 1359211465,
			                    "Train": "1292",
			                    "Lat": 42.35533,
			                    "Long": -71.06059,
			                    "Heading": 25
			                },
			                "Predictions": [
			                    {
			                        "StopID": "70023",
			                        "Stop": "State Street",
			                        "Seconds": 70
			                    },
			                    {
			                        "StopID": "70025",
			                        "Stop": "Haymarket",
			                        "Seconds": 177
			                    },
			                    {
			                        "StopID": "70027",
			                        "Stop": "North Station",
			                        "Seconds": 384
			                    },
			                    {
			                        "StopID": "70029",
			                        "Stop": "Community College",
			                        "Seconds": 844
			                    },
			                    {
			                        "StopID": "70031",
			                        "Stop": "Sullivan",
			                        "Seconds": 984
			                    },
			                    {
			                        "StopID": "70033",
			                        "Stop": "Wellington",
			                        "Seconds": 1152
			                    }
			                ]
			            },
			            {
			                "TripID": "O985F6317",
			                "Destination": "Forest Hills",
			                "Note": "Delayed",
			                "Position": {
			                    "Timestamp": 1359210831,
			                    "Train": "1276",
			                    "Lat": 42.34767,
			                    "Long": -71.07464,
			                    "Heading": 265
			                },
			                "Predictions": [
			                    {
			                        "StopID": "70012",
			                        "Stop": "Mass Ave",
			                        "Seconds": 66
			                    },
			                    {
			                        "StopID": "70010",
			                        "Stop": "Ruggles",
			                        "Seconds": 148
			                    },
			                    {
			                        "StopID": "70008",
			                        "Stop": "Roxbury Crossing",
			                        "Seconds": 247
			                    },
			                    {
			                        "StopID": "70006",
			                        "Stop": "Jackson Square",
			                        "Seconds": 344
			                    },
			                    {
			                        "StopID": "70004",
			                        "Stop": "Stony Brook",
			                        "Seconds": 440
			                    },
			                    {
			                        "StopID": "70002",
			                        "Stop": "Green Street",
			                        "Seconds": 532
			                    },
			                    {
			                        "StopID": "70001",
			                        "Stop": "Forest Hills",
			                        "Seconds": 710
			                    }
			                ]
			            }
			        ]
			    }
			}
        '''		
		def response = service.getTimesForStation(station,new JSONObject(lineData))
		assert response == ['Ruggles Station':['Oak Grove':[2], 'Forest Hills':[2]]]
	}
	
	void testTimesForStationNullSchedule(){
		
		Station station = new Station(
			line: "red",
			platformKey:"a",
			platformName:"a",
			stationName:"a",
			platformOrder:"a",
			startOfLine:"a",
			endOfLine:"true",
			branch:"a",
			direction:"a",
			stopId:"a",
			stopCode:"a",
			stopName:"Ruggles Station",
			stopDescription:"a",
			latitude:1.0,
			longitude:2.0)
		
		def response = service.getTimesForStation(station,null)
		println response
		assert response.contains("Ruggles Station")
		assert !response.contains("Forest Hills")
		assert !response.contains("Oak Grove")
		
	}
}
