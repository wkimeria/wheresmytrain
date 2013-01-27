import com.trainschedule.*

class BootStrap {

	
    def init = { servletContext ->
		
		if(!Station.findByLine('Red')){
			def counter =0
			new File("data/RealTimeHeavyRailKeys.csv").eachLine{line->
				if(counter!=0){
					def row = line.split(',')
					if(!Station.findByStopNameAndLine(row[11],row[0])){
						Station station = new Station(
							line:row[0],
							platformKey:row[1],
							platformName:row[2],
							stationName:row[3],
							platformOrder:row[4],
							startOfLine:row[5],
							endOfLine:row[6],
							branch:row[7],
							direction:row[8],
							stopId:row[9],
							stopCode:row[10],
							stopName:row[11],
							stopDescription:row[12],
							latitude:row[13].toFloat(),
							longitude:row[14].toFloat()).save(failOnError:true)
					}					
				}
				counter++
			}
		}
    }
    def destroy = {
    }
}
