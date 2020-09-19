//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Антон Калинин on 19.09.2020.
//

import Foundation

class TaskManager {
    var tasksCount = 0
    var doneTasksCount = 0
    
    func add(task: Task) {
        tasksCount += 1
    }
    
    func task(at: Int) -> Task {
        return Task(title: "")
    }
}
