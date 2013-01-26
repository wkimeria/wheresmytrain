package com.trainschedule
class GetScheduleJob {

	static triggers = {
		simple name: 'mySimpleTrigger', startDelay: 1000, repeatInterval: 15000  
	}
  
	def scheduleInformationService
	def concurrent = false
  
	def group = "MyGroup"
  	def execute(){
		  def lines =['red','blue','orange']
		  lines.each{			  		  
			  scheduleInformationService.cacheNewDataForLineFromMBTA(it)
			  Thread.sleep(15000)			
		  }	 
	}
}
