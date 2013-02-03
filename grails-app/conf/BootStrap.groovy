import com.trainschedule.*

class BootStrap {

	
    def init = { servletContext ->
		
		if(!Station.findByLine('Red')){			
			new Station(line:'Red',platformOrder:17,stopName:'Alewife Station',latitude:42.395428,longitude:-71.14249).save(failOnError:true)
			new Station(line:'Red',platformOrder:16,stopName:'Davis Station',latitude:42.39674,longitude:-71.12182).save(failOnError:true)
			new Station(line:'Red',platformOrder:15,stopName:'Porter Square Station',latitude:42.3884,longitude:-71.11915).save(failOnError:true)
			new Station(line:'Red',platformOrder:14,stopName:'Harvard Square Station',latitude:42.373363,longitude:-71.11896).save(failOnError:true)
			new Station(line:'Red',platformOrder:13,stopName:'Central Square Station',latitude:42.365486,longitude:-71.103806).save(failOnError:true)
			new Station(line:'Red',platformOrder:12,stopName:'Kendall/MIT Station',latitude:42.36249,longitude:-71.086174).save(failOnError:true)
			new Station(line:'Red',platformOrder:11,stopName:'Charles/MGH Station',latitude:42.361164,longitude:-71.070625).save(failOnError:true)
			new Station(line:'Red',platformOrder:10,stopName:'Park St. Station',latitude:42.356396,longitude:-71.06242).save(failOnError:true)
			new Station(line:'Red',platformOrder:9,stopName:'Downtown Crossing Station',latitude:42.35552,longitude:-71.06023).save(failOnError:true)
			new Station(line:'Red',platformOrder:8,stopName:'South Station',latitude:42.352272,longitude:-71.055244).save(failOnError:true)
			new Station(line:'Red',platformOrder:7,stopName:'Broadway Station',latitude:42.34262,longitude:-71.05697).save(failOnError:true)
			new Station(line:'Red',platformOrder:6,stopName:'Andrew Station',latitude:42.330154,longitude:-71.057655).save(failOnError:true)
			new Station(line:'Red',platformOrder:5,stopName:'JFK/UMass Station',latitude:42.320686,longitude:-71.05239).save(failOnError:true)
			new Station(line:'Red',platformOrder:4,stopName:'Savin Hill Station',latitude:42.31129,longitude:-71.05333).save(failOnError:true)
			new Station(line:'Red',platformOrder:3,stopName:'Fields Corner Station',latitude:42.300095,longitude:-71.06167).save(failOnError:true)
			new Station(line:'Red',platformOrder:2,stopName:'Shawmut Station',latitude:42.293125,longitude:-71.065735).save(failOnError:true)
			new Station(line:'Red',platformOrder:1,stopName:'Ashmont Station',latitude:42.284653,longitude:-71.06449).save(failOnError:true)
			new Station(line:'Red',platformOrder:0,stopName:'North Quincy Station',latitude:42.275276,longitude:-71.02959).save(failOnError:true)
			new Station(line:'Red',platformOrder:-1,stopName:'Wollaston Station',latitude:42.266514,longitude:-71.02034).save(failOnError:true)
			new Station(line:'Red',platformOrder:-2,stopName:'Quincy Center Station',latitude:42.25181,longitude:-71.00541).save(failOnError:true)
			new Station(line:'Red',platformOrder:-3,stopName:'Quincy Adams Station',latitude:42.23339,longitude:-71.00716).save(failOnError:true)
			new Station(line:'Red',platformOrder:-4,stopName:'Braintree Station',latitude:42.207855,longitude:-71.00114).save(failOnError:true)
			new Station(line:'Orange',platformOrder:18,stopName:'Oak Grove Station',latitude:42.43668,longitude:-71.0711).save(failOnError:true)
			new Station(line:'Orange',platformOrder:17,stopName:'Malden Center Station',latitude:42.426632,longitude:-71.07411).save(failOnError:true)
			new Station(line:'Orange',platformOrder:16,stopName:'Wellington Station',latitude:42.40237,longitude:-71.07708).save(failOnError:true)
			new Station(line:'Orange',platformOrder:15,stopName:'Sullivan Station',latitude:42.383976,longitude:-71.076996).save(failOnError:true)
			new Station(line:'Orange',platformOrder:14,stopName:'Community College Station',latitude:42.373623,longitude:-71.069534).save(failOnError:true)
			new Station(line:'Orange',platformOrder:13,stopName:'North Station',latitude:42.365578,longitude:-71.06129).save(failOnError:true)
			new Station(line:'Orange',platformOrder:12,stopName:'Haymarket Station',latitude:42.36302,longitude:-71.05829).save(failOnError:true)
			new Station(line:'Orange',platformOrder:11,stopName:'State St. Station',latitude:42.35898,longitude:-71.057594).save(failOnError:true)
			new Station(line:'Orange',platformOrder:10,stopName:'Downtown Crossing Station',latitude:42.35552,longitude:-71.06023).save(failOnError:true)
			new Station(line:'Orange',platformOrder:9,stopName:'Chinatown Station',latitude:42.352547,longitude:-71.06275).save(failOnError:true)
			new Station(line:'Orange',platformOrder:8,stopName:'Tufts Medical Center Station',latitude:42.349663,longitude:-71.06392).save(failOnError:true)
			new Station(line:'Orange',platformOrder:7,stopName:'Back Bay Station',latitude:42.34735,longitude:-71.07573).save(failOnError:true)
			new Station(line:'Orange',platformOrder:6,stopName:'Massachusetts Ave. Station',latitude:42.34151,longitude:-71.08342).save(failOnError:true)
			new Station(line:'Orange',platformOrder:5,stopName:'Ruggles Station',latitude:42.336376,longitude:-71.08896).save(failOnError:true)
			new Station(line:'Orange',platformOrder:4,stopName:'Roxbury Crossing Station',latitude:42.331398,longitude:-71.09545).save(failOnError:true)
			new Station(line:'Orange',platformOrder:3,stopName:'Jackson Square Station',latitude:42.32313,longitude:-71.099594).save(failOnError:true)
			new Station(line:'Orange',platformOrder:2,stopName:'Stony Brook Station',latitude:42.317062,longitude:-71.10425).save(failOnError:true)
			new Station(line:'Orange',platformOrder:1,stopName:'Green St. Station',latitude:42.310524,longitude:-71.107414).save(failOnError:true)
			new Station(line:'Orange',platformOrder:0,stopName:'Forest Hills Station',latitude:42.30052,longitude:-71.113686).save(failOnError:true)
			new Station(line:'Blue',platformOrder:12,stopName:'Wonderland Station',latitude:42.41342,longitude:-70.991646).save(failOnError:true)
			new Station(line:'Blue',platformOrder:11,stopName:'Revere Beach Station',latitude:42.40784,longitude:-70.99253).save(failOnError:true)
			new Station(line:'Blue',platformOrder:10,stopName:'Beachmont Station',latitude:42.39754,longitude:-70.99232).save(failOnError:true)
			new Station(line:'Blue',platformOrder:9,stopName:'Suffolk Downs Station',latitude:42.3905,longitude:-70.99712).save(failOnError:true)
			new Station(line:'Blue',platformOrder:8,stopName:'Orient Heights Station',latitude:42.386868,longitude:-71.00474).save(failOnError:true)
			new Station(line:'Blue',platformOrder:7,stopName:'Wood Island Station',latitude:42.37964,longitude:-71.022865).save(failOnError:true)
			new Station(line:'Blue',platformOrder:6,stopName:'Airport Station',latitude:42.374264,longitude:-71.030396).save(failOnError:true)
			new Station(line:'Blue',platformOrder:5,stopName:'Maverick Station',latitude:42.369118,longitude:-71.03953).save(failOnError:true)
			new Station(line:'Blue',platformOrder:4,stopName:'Aquarium Station',latitude:42.359783,longitude:-71.05165).save(failOnError:true)
			new Station(line:'Blue',platformOrder:3,stopName:'State St. Station',latitude:42.35898,longitude:-71.057594).save(failOnError:true)
			new Station(line:'Blue',platformOrder:2,stopName:'Government Center Station',latitude:42.359707,longitude:-71.05921).save(failOnError:true)
			new Station(line:'Blue',platformOrder:1,stopName:'Bowdoin Station',latitude:42.361366,longitude:-71.062035).save(failOnError:true)			
		}
    }
    def destroy = {
    }
}
