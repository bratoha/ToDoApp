//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Антон Калинин on 19.09.2020.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {
    
    var sut: TaskManager!

    override func setUp()  {
        sut = TaskManager()
        super.setUp()
    }

    override func tearDown()  {
        sut.removeAll()
        sut = nil
        super.tearDown()
    }
    
    func testInitTaskManagerWithZeroTasks() {
        // System under test
        XCTAssertEqual(sut.tasksCount, 0)
    }

    func testInitTaskManagerWithZeroDoneTasks() {
        // System under test
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task, returnedTask)
    }
    
    func testCheckTaskAtIndexChangesCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    func testCheckedTasksRemoveFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    
    func testDoneTasksAtReturnCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedtask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedtask, task)
    }
    
    func testRemoveAllResultCountBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        
        sut.checkTask(at: 0)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddingSameObjectDoseNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))
        
        XCTAssertTrue(sut.tasksCount == 1)
    }
    
    func testWhenTaskManagerRecreatedSavedTasksShouldBeEqual() {
        var taskManager: TaskManager! = TaskManager()
        let task1 = Task(title: "Foo")
        let task2 = Task(title: "Bar")
        
        taskManager.add(task: task1)
        taskManager.add(task: task2)
        
        NotificationCenter.default.post(name: UIApplication.willResignActiveNotification, object: nil)
        
        taskManager = nil
        
        taskManager = TaskManager()
        
        XCTAssertEqual(taskManager.tasksCount, 2)
        XCTAssertEqual(taskManager.task(at: 0), task1)
        XCTAssertEqual(taskManager.task(at: 1), task2)
    }
}
