//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Антон Калинин on 20.09.2020.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(withTask task: Task) {
        self.titleLabel.text = task.title
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        
        dateLabel.text = df.string(from: task.date!)
        locationLabel.text = task.location?.name
    }

}
