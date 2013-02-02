package com.trainschedule
class GetScheduleOrangeLineJob {

	static triggers = {
		//simple name: 'mySimpleTrigger', startDelay: 1000, repeatInterval: 15000  
		cron name:'cronTriggerOrange', startDelay:1000, cronExpression: '10/30 * * * * ?'
	}
  
	def scheduleInformationService
	def concurrent = false
	def grailsApplication
  
	def group = "MyGroupOrange"
  	def execute(){
		  log.info "called for orange info at ..." + new Date()
		  def line ='orange'
		  scheduleInformationService.cacheNewDataForLineFromMBTA(line)		
	}
}
