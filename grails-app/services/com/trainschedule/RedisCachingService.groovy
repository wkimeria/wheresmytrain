package com.trainschedule

import redis.clients.jedis.Jedis

class RedisCachingService {

    static transactional = false

    static profiled = true

    def redisService

    def save(key, value, expiry=null){
        redisService.withRedis { Jedis redis ->
            redis.set(key, value)
            if(expiry){
                redis.expire(key, expiry)
            }
        }
    }

    def delete(key){
        redisService.withRedis { Jedis redis ->
            redis.del(key)
        }
    }

    def deleteMultiple(pattern){
        redisService.withRedis { Jedis redis ->
            def keys = redis.keys(pattern)
            keys.each{ key ->
                redis.del(key)
            }
        }
    }

    def get(key, expiry=null){
        def result
        redisService.withRedis { Jedis redis ->
            //Reset expiry on key if specified
            if(expiry){
                redis.expire(key, expiry)
            }
            result = redis.get(key)
        }
        return result
    }

    def getKeys(keyPattern){

        def result

        redisService.withRedis { Jedis redis ->
            result = redis.keys(keyPattern)
        }
        return result
    }

    def keys(pattern) {
        def result
        redisService.withRedis { Jedis redis ->
           result = redis.keys(pattern)
        }
        return result
    }
}
