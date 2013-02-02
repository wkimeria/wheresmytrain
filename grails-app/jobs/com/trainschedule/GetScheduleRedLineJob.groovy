package com.trainschedule
class GetScheduleRedLineJob {

	static triggers = {
		//simple name: 'mySimpleTrigger', startDelay: 1000, repeatInterval: 15000  
		cron name:'cronTriggerRed', startDelay:1000, cronExpression: '20/30 * * * * ?'
	}
  
	def scheduleInformationService
	def concurrent = false
	def grailsApplication
  
	def group = "MyGroupRed"
  	def execute(){
		  log.info "called for red info at ..." + new Date()
		  def line ='red'
		  scheduleInformationService.cacheNewDataForLineFromMBTA(line)		 
	}
}
