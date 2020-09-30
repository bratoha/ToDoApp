//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Калинин Антон Игоревич on 18.09.2020.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
     
        XCTAssertNotNil(task)
    }

    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
     
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testtaskInitsWithDate() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        
        let task = Task(title: "Foo", description: "Bar", location: location)
        
        XCTAssertEqual(location, task.location)
    }
    
    func testCanBeCreatedFromPlistDictionary() {
        let location = Location(name: "Baz")
        let date = Date(timeIntervalSince1970: 10)
        let task = Task(title: "Foo", description: "Bar", date: date, location: location)
        
        let locationDictionary: [String: Any] = ["name": "Baz"]
        let dictionary: [String: Any] = ["title": "Foo",
                                         "description": "Bar",
                                         "date": date,
                                         "location": locationDictionary]
        
        let createdTask = Task(dict: dictionary)
        
        XCTAssertEqual(createdTask, task)
    }
}
