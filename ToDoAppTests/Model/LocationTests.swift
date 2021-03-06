//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Антон Калинин on 19.09.2020.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LocationTests: XCTestCase {
    
    func testInitSetsName() {
        let location = Location(name: "Foo")
        
        XCTAssertEqual(location.name, "Foo")
    }

    func testInitSetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(
            latitude: 1,
            longitude: 2
        )
        
        let location = Location(name: "Foo", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude) 
    }
    
    func testCanBeCreatedFromPlistDictionary() {
        let location = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 10, longitude: 10))
        let dict: [String: Any] = ["name": "Foo",
                                   "latitude": 10.0,
                                   "longitude": 10.0]
        
        let createdLocation = Location(dict: dict)
        
        XCTAssertEqual(createdLocation, location)
    }
    
    func testCanBeSerializedIntoDictionary() {
        let location = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 10, longitude: 10))
        
        let generatedLocation = Location(dict: location.dict)
        
        XCTAssertEqual(generatedLocation, location)
    }
}
