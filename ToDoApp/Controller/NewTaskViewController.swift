//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Антон Калинин on 22.09.2020.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func save() {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormatter.date(from: dateTextField.text!)
        let descriptionString = descriptionTextField.text
        let addressString = addressTextField.text
        
        geocoder.geocodeAddressString(addressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let task = Task(title: titleString!, description: descriptionString, date: date, location: Location(name: locationString!, coordinate: coordinate))
            self.taskManager.add(task: task)
        }
    }

}
