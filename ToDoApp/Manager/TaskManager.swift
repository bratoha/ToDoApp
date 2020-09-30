//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Антон Калинин on 19.09.2020.
//

import UIKit

class TaskManager {
    
    private var tasks = [Task]()
    private var doneTasks = [Task]()
    
    var tasksCount: Int {
        return tasks.count
    }
    
    var doneTasksCount: Int {
        return doneTasks.count
    }
    
    var tasksURL: URL {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let documentURL = fileURLs.first else {
            fatalError()
        }
        
        return documentURL.appendingPathComponent("tasks.plist")
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(save), name: UIApplication.willResignActiveNotification, object: nil)
        
        if let data = try? Data(contentsOf: tasksURL) {
            let dictionaries = try? PropertyListSerialization.propertyList(from: data,
                                                                           options: [],
                                                                           format: nil
            ) as? [[String: Any]]
            
            if let dictionaries = dictionaries {
                for dict in dictionaries {
                    if let task = Task(dict: dict) {
                        tasks.append(task)
                    }
                }
            }
        }
    }
    
    deinit {
        save()
    }
    
    @objc func save() {
        let tasksDictionaries = self.tasks.map { $0.dict }
        guard tasksDictionaries.count > 0 else {
            try? FileManager.default.removeItem(at: tasksURL)
            return
        }
        
        let plistData = try? PropertyListSerialization.data(fromPropertyList: tasksDictionaries,
                                                            format: .xml,
                                                            options: PropertyListSerialization.WriteOptions(0))
        
        try? plistData?.write(to: tasksURL, options: .atomic)
    }
    
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        doneTasks.append(tasks.remove(at: index))
    }
    
    func uncheckTask(at index: Int) {
        tasks.append(doneTasks.remove(at: index))
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
