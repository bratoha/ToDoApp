//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Антон Калинин on 19.09.2020.
//

import UIKit

class DataProvider: NSObject, UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
