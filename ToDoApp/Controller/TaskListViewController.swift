//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Калинин Антон Игоревич on 18.09.2020.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: DataProvider!

    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        if let viewController = storyboard?.instantiateViewController(identifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController {
            viewController.taskManager = self.dataProvider.taskManager
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let taskManger = TaskManager()
        dataProvider.taskManager = taskManger
        
        NotificationCenter.default.addObserver(self, selector: #selector(showDetailsWithNotification), name: NSNotification.Name("DidSelectRowNotification"), object: nil)
        
        view.accessibilityIdentifier = "mainView"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func showDetailsWithNotification(withNotification notification: Notification) {
        guard let userInfo = notification.userInfo,
              let task = userInfo["task"] as? Task,
              let detailViewController = storyboard?.instantiateViewController(identifier: String(describing: DetailViewController.self)) as? DetailViewController else {
            fatalError()
        }
        
        detailViewController.task = task
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

