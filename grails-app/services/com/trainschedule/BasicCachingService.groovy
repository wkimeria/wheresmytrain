package com.trainschedule

class BasicCachingService {

	def cache =[:]
    def save(key, value, expiry=null){
    	cache.put(key, value)
    }
	
	def get(key, expiry=null){
		return cache.get(key)	
	}
}
