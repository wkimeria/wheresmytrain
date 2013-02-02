package com.trainschedule
class GetScheduleBlueLineJob {

	static triggers = {
		//simple name: 'mySimpleTrigger', startDelay: 1000, repeatInterval: 15000  
		cron name:'cronTriggerBlue', startDelay:1000, cronExpression: '0/30 * * * * ?'
	}
  
	def scheduleInformationService
	def concurrent = false
	def grailsApplication
  
	def group = "MyGroupBlue"
  	def execute(){
		  log.info "called for blue info at ..." + new Date()
		  def line ='blue'
		  scheduleInformationService.cacheNewDataForLineFromMBTA(line)		
	}
}
