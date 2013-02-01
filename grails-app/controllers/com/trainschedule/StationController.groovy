package com.trainschedule

import org.springframework.dao.DataIntegrityViolationException

class StationController {
	def stationService	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = 200
        [stationInstanceList: Station.list(max:max, sort: "platformOrder", order: "desc"), stationInstanceTotal: Station.count(),
			mapColumns: stationService.headers(), mapData: stationService.data()]
    }

    def create() {
        [stationInstance: new Station(params)]
    }

    def save() {
        def stationInstance = new Station(params)
        if (!stationInstance.save(flush: true)) {
            render(view: "create", model: [stationInstance: stationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'station.label', default: 'Station'), stationInstance.id])
        redirect(action: "show", id: stationInstance.id)
    }

    def show(Long id) {
        def stationInstance = Station.get(id)
        if (!stationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "list")
            return
        }
		
		def schedule = stationService.getRealTimeInfoForStation(stationInstance)
		
        [stationInstance: stationInstance, schedule:schedule]
    }

    def edit(Long id) {
        def stationInstance = Station.get(id)
        if (!stationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "list")
            return
        }

        [stationInstance: stationInstance]
    }

    def update(Long id, Long version) {
        def stationInstance = Station.get(id)
        if (!stationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stationInstance.version > version) {
                stationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'station.label', default: 'Station')] as Object[],
                          "Another user has updated this Station while you were editing")
                render(view: "edit", model: [stationInstance: stationInstance])
                return
            }
        }

        stationInstance.properties = params

        if (!stationInstance.save(flush: true)) {
            render(view: "edit", model: [stationInstance: stationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'station.label', default: 'Station'), stationInstance.id])
        redirect(action: "show", id: stationInstance.id)
    }

    def delete(Long id) {
        def stationInstance = Station.get(id)
        if (!stationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "list")
            return
        }

        try {
            stationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'station.label', default: 'Station'), id])
            redirect(action: "show", id: id)
        }
    }
}
