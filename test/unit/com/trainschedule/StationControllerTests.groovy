package com.trainschedule



import org.junit.*
import grails.test.mixin.*

@TestFor(StationController)
@Mock(Station)
class StationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/station/list" == response.redirectedUrl
    }

    void testList() {

		/*
        def model = controller.list()

        assert model.stationInstanceList.size() == 0
        assert model.stationInstanceTotal == 0
        */
		assert "No Methods to be unit tested as of now"
    }
}
